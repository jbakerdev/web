# frozen_string_literal: true

class IconComponent < ViewComponent::Base
  DEFAULT_SCHEME = :solid
  SCHEME_MAPPINGS = {
    DEFAULT_SCHEME => "fas",
    :regular => "far",
    :light => "fal",
    :duotone => "fad",
    :brands => "fab"
  }.freeze

  SIZE_MAPPINGS = {
    sm: "text-xl",
    md: "text-2xl",
    lg: "text-3xl"
  }.freeze
  SIZE_OPTIONS = SIZE_MAPPINGS.keys

  def initialize(name:, scheme: DEFAULT_SCHEME, size: nil)
    @scheme = scheme
    @size = size
    @name = name
  end

  def css_classes
    [SCHEME_MAPPINGS[@scheme], SIZE_MAPPINGS[@size], ["fa", @name.to_s].join("-")].join(" ")
  end

  def call
    content_tag(:i, nil, class: css_classes)
  end
end
