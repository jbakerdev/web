require "test_helper"

class ButtonComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders default button" do
    render_inline ButtonComponent.new

    assert_selector "button", class: %w[bg-magenta]
  end

  # Scheme

  test "renders primary button" do
    render_inline ButtonComponent.new(scheme: :primary)

    assert_selector "button", class: %w[bg-magenta]
  end

  test "renders secondary button" do
    render_inline ButtonComponent.new(scheme: :secondary)

    assert_selector "button", class: %w[bg-base01]
  end

  test "renders success button" do
    render_inline ButtonComponent.new(scheme: :success)

    assert_selector "button", class: %w[bg-cyan]
  end

  test "renders warning button" do
    render_inline ButtonComponent.new(scheme: :warning)

    assert_selector "button", class: %w[bg-yellow]
  end

  test "renders danger button" do
    render_inline ButtonComponent.new(scheme: :danger)

    assert_selector "button", class: %w[bg-red]
  end

  # Size

  test "renders small button" do
    render_inline ButtonComponent.new(size: :sm)

    assert_selector "button", class: %w[px-3 text-sm]
  end

  test "renders medium button" do
    render_inline ButtonComponent.new(size: :md)

    assert_selector "button", class: %w[px-4 text-sm]
  end

  test "renders large button" do
    render_inline ButtonComponent.new(size: :lg)

    assert_selector "button", class: %w[px-4 text-base]
  end
end
