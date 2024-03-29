# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  renders_one :icon, IconComponent

  DEFAULT_SCHEME = :notice
  SCHEME_MAPPINGS = {
    DEFAULT_SCHEME => "bg-blue",
    :alert => "bg-red"
  }.freeze

  ICON_MAPPINGS = {
    DEFAULT_SCHEME => "check-circle",
    :alert => "skull-crossbones"
  }.freeze

  def initialize(scheme: DEFAULT_SCHEME)
    @scheme = scheme
    @color = SCHEME_MAPPINGS[scheme]
    @icon_name = ICON_MAPPINGS[scheme]
  end

  def render?
    content.present?
  end
end
