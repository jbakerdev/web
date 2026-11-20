# Ruby 3.4.9 → 4.0.10 upgrade analysis

_Generated 2026-11-19 by the `rubypowers:ruby-upgrade` skill. Target: **Ruby 4.0.10** (latest stable 4.0.x at time of writing)._
_Breaking-change inventory: `rubypowers` plugin `skills/ruby-upgrade/references/ruby-4-0-changes.md`._

## 1. TL;DR

- **Verdict: LOW risk.**
- **Estimated effort:** ~1 hour (version bumps + bundle + test run), plus a post-deploy watch.
- **Code exposure:** zero hits for every code-level breaking change (Net::HTTP, CGI, demoted gems, Set, pipe `open`, Process::Status, Ractor, URI.escape).
- **Top 3 things to watch:**
  1. **Version pins live in three places** — `.ruby-version`, `mise.toml`, `Dockerfile` (`ARG RUBY_VERSION`). All three must move together.
  2. **Prebuilt native gems without a `ruby` platform fallback** — `nokogiri 1.19.4` and `pg 1.6.3` are locked only as platform gems. If a prebuilt binary lacks a Ruby 4.0 build, Bundler cannot compile from source.
  3. **Honeybadger fingerprint drift** (change-10) — expect new error groups for ~24h after deploy.

## 2. Current state

| Item | Value |
|------|-------|
| `.ruby-version` | `ruby-3.4.9` |
| `mise.toml` | `ruby = "3.4.9"` |
| `Gemfile` `ruby` directive | none |
| `Gemfile.lock` `RUBY VERSION` | none |
| `Gemfile.lock` `BUNDLED WITH` | 2.7.1 |
| Dockerfile | `ARG RUBY_VERSION=3.4.9` → `FROM docker.io/library/ruby:$RUBY_VERSION-slim` |
| CI (`.github/workflows/ci.yml`) | `ruby/setup-ruby@v1` with `ruby-version: .ruby-version` (no literal pin) |
| Deploy (`.github/workflows/deploy.yml`) | no Ruby pin; sends Honeybadger deploy marker |
| `.rubocop.yml` `TargetRubyVersion` | not set (inherited from `rubocop-rails-omakase`, inferred from `.ruby-version`) |
| Sorbet / Steep | not used |
| rails | 8.1.3 |
| rubocop | 1.81.1 |
| openssl gem | not locked |
| logger / ostruct / irb / reline / rdoc | 1.7.0 / 0.6.3 / 1.17.0 / 0.6.3 / 7.2.0 (all transitive) |
| benchmark / pstore / readline / fiddle | not locked (not used) |
| debug | 1.11.1 |
| nokogiri | 1.19.4 (platform gems only) |
| pg | 1.6.3 (platform gems only) |
| bcrypt / msgpack | 3.1.22 / 1.8.4 |
| grpc / ffi / pry | not present |

## 3. Risk matrix

| # | Change | Exposure | Risk | Action |
|---|--------|----------|------|--------|
| 01 | `Net::HTTP` implicit Content-Type removed | 0 app hits. No Faraday/HTTParty/RestClient/Excon/http/Typhoeus. Internal Net::HTTP users: honeybadger, selenium-webdriver (test), capybara (test, GET only) | Low | Confirm Honeybadger reports still land after deploy |
| 02 | `CGI.parse` / `CGI::Cookie` / `CGI::Session` removed | 0 hits | None | None — do not add `gem "cgi"` |
| 03 | Default gems demoted to bundled | 0 direct `require`s; ostruct/logger/irb/reline/rdoc already resolved transitively | None | None — do not add demoted gems |
| 04 | `SortedSet` removed | 0 hits | None | None |
| 05 | `Set#inspect` format | 0 hits in `test/` | None | None |
| 06 | `Kernel#open` pipe form removed | 0 hits (`bin/setup` uses `system`, `lib/tasks/fly.rake` uses `sh`) | None | None |
| 07 | `Process::Status#&` / `#>>` removed | 0 hits | None | None |
| 08 | OpenSSL 4 default | No `openssl` pin; no jwt/devise/doorkeeper/omniauth/ruby-saml | None | None |
| 09 | Native-extension recompile | No `vendor/bundle`. ~18 source-compiled ext gems (bcrypt, bootsnap, puma, msgpack, nio4r, json, psych, prism, redcarpet, …). nokogiri + pg are platform-only | Medium | Fresh `bundle install` under 4.0.10; verify nokogiri/pg resolve 4.0 binaries |
| 10 | Backtrace / `ArgumentError` format changes | Honeybadger with default config; 0 backtrace-parsing code | Medium (observability) | Expect fingerprint churn ~24h post-deploy |
| 11 | Ractor API removals | 0 hits | None | None |
| 12 | Chilled / frozen string literals | 10 of 69 `.rb` files have the magic comment; 0 literal-mutation hits | Low | Optional follow-up: add the magic comment app-wide |
| 13 | `URI.escape` and friends | 0 hits | None | None |
| 14 | ZJIT experimental, RJIT removed | No JIT flags anywhere | None | Keep YJIT; do not enable `--zjit` |

## 4. Phased checklist

### Phase 4 — mechanical updates
- [x] `.ruby-version` → `ruby-4.0.10`
- [x] `mise.toml` → `ruby = "4.0.10"`
- [x] `Dockerfile` → `ARG RUBY_VERSION=4.0.10` (registry prefix `docker.io/library/` unchanged)
- [x] CI YAML — no change needed (reads `.ruby-version`)
- [x] `.rubocop.yml` — no change needed (no explicit `TargetRubyVersion` pin)
- [x] `Gemfile` — no change needed (no CGI or demoted-gem usage)
- [x] `bundle install` / `bundle update --ruby` under 4.0.10
- [x] `bundle update rubocop --conservative` (1.81.1 → 1.92.3; 1.81.1 rejects target Ruby 4.0)

### Phase 5 — verify
- [x] `bin/rubocop` — 72 files, no offenses (after the RuboCop bump)
- [x] `bin/rails test` — 37 runs, 40 assertions, 0 failures, 0 errors
- [x] Native extensions load: nokogiri 1.19.4, pg 1.6.3, bcrypt, msgpack, puma, nio4r, bootsnap
- [ ] `bin/rails test:system` — 3 errors locally, **not Ruby-related** (see Verification notes)
- [ ] `docker build .` to confirm the `ruby:4.0.10-slim` image exists and gems compile (not run locally)

### Phase 6 — post-merge watch
- [ ] Honeybadger: new fingerprints / `ArgumentError` groups for 24h after the deploy marker
- [ ] Honeybadger: confirm events still arrive (change-01 sanity check)

## 5. Surprises

- **Three pins, not one.** `mise.toml` duplicates `.ruby-version`, and the Dockerfile has its own `ARG`. CI is fine because it reads `.ruby-version`.
- **`system-test` CI job omits `ruby-version:`.** `ruby/setup-ruby` falls back to `.ruby-version` anyway, so this works, but it's inconsistent with the other jobs.
- **Platform-only native gems.** The lockfile lists six platforms (`aarch64-linux`, `arm64-darwin-21..24`, `x86_64-linux`) and no `ruby` platform.
- **mise's precompiled Ruby 4.0.10 is unusable on macOS 15.** `mise install ruby@4.0.10` downloads a binary built on macOS 26 (`arm64-darwin25`). Its headers include `<stdckdint.h>`, which the macOS 15.8 Command Line Tools SDK lacks, so *every* native-extension build fails with `The compiler failed to generate an executable file`. This is a local-dev issue only (Docker and CI are unaffected). Fix: `MISE_RUBY_COMPILE=true mise install --force ruby@4.0.10`, or upgrade to macOS 26. Every developer on macOS 15 will hit this.
- **Clean codebase.** No monkey-patches, no vendored gems, stock initializers, stock `bin/` scripts.

## Verification notes

### Bundle resolution diff (`Gemfile.lock`)

- `unicode-emoji` 4.1.0 → 4.3.0. **Forced:** 4.1.0 declares `required_ruby_version < 4.0`.
- `rubocop` 1.81.1 → 1.92.3 and `rubocop-ast` 1.47.1 → 1.53.0. **Forced:** RuboCop 1.81.1 aborts with `RuboCop supports target Ruby versions 3.3 and above with Prism. Specified target Ruby version: 4.0`.
- No other changes. No Gemfile changes.

### System test errors (pre-existing, Ruby-independent)

All 3 system tests error in teardown with `Selenium::WebDriver::Error::InvalidArgumentError: invalid argument: * is not a valid URL (Session info: chrome=158.0.8127.36)`. Capybara 3.40.0 (the latest release) calls `execute_cdp('Storage.clearDataForOrigin', origin: '*', ...)` in `ChromeDriver#reset!`, and Chrome 158 rejects the `*` origin. The same failure happens on any Ruby. A Ruby 3.4.9 baseline could not be run locally (see below). CI's `system-test` job installs `google-chrome-stable`, so it likely already fails on `main`; track that separately.

### Local toolchain: both 3.4.9 and the precompiled 4.0.10 cannot build native gems

The installed Ruby 3.4.9 (built here with `CC=clang`) has the same `stdckdint.h` failure as the precompiled 4.0.10. Its `config.h` was generated against a toolchain that provided that header, and the current Command Line Tools at `/Library/Developer/CommandLineTools` do not. Ruby 4.0.10 compiled from source today works correctly. Rebuilding 3.4.9 the same way would fix it, but that's moot after this upgrade.

## 6. Open questions for the team

- **Type checker:** N/A (no Sorbet/Steep).
- **Docker registry:** the image is pulled from Docker Hub directly. Confirm Fly's builder can pull `ruby:4.0.10-slim`.
- **Monitoring owner:** who watches Honeybadger after the deploy so fingerprint churn isn't mistaken for a regression?
- **Lagging gems:** none of the usual laggards (grpc, sorbet) are present.
