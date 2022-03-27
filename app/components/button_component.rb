# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  DEFAULT_SCHEME = :primary
  LINK_SCHEME = :link
  SCHEME_MAPPINGS = {
    DEFAULT_SCHEME => "bg-magenta hover:bg-magenta hover:ring-magenta",
    :secondary     => "bg-solar3  hover:bg-solar3 focus:ring-solar3",
    :success       => "bg-cyan    hover:bg-cyan focus:ring-cyan",
    :warning       => "bg-yellow  hover:bg-yellow focus:ring-yellow",
    :danger        => "bg-red     hover:bg-red focus:ring-red",
    LINK_SCHEME    => "btn-link"
  }.freeze
  SCHEME_OPTIONS = SCHEME_MAPPINGS.keys

  DEFAULT_SIZE = :md
  SIZE_MAPPINGS = {
    :sm          => "px-3 py-2 text-sm   font-medium leading-4",
    DEFAULT_SIZE => "px-4 py-2 text-sm   font-medium",
    :lg          => "px-4 py-2 text-base font-medium"
  }.freeze
  SIZE_OPTIONS = SIZE_MAPPINGS.keys

  BASE_CSS = %w[
    inline-flex items-center
    border border-transparent
    rounded-md
    shadow-sm text-white
    hover:ring-2 hover:ring-white
    focus:outline-none focus:ring-2 focus:ring-offset-2
  ]

  def initialize(scheme: DEFAULT_SCHEME, size: DEFAULT_SIZE)
    @scheme = scheme
    @size = size
  end

  def css_classes
    [
      BASE_CSS,
      SCHEME_MAPPINGS[@scheme],
      SIZE_MAPPINGS[@size]
    ].join(" ")
  end

  def call
    content_tag(:button, content, class: css_classes)
  end
end
