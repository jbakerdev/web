# frozen_string_literal: true

class NavbarLinkComponent < ViewComponent::Base
  def initialize(name:, url:, target: nil)
    @content = name
    @options = {
      href: url,
      class: %w[
        text-solar1
        hover:text-solar3
        px-3
        py-2
        text-sm
        font-medium
      ],
      target: target
    }
  end

  def call
    content_tag(:a, @content, @options)
  end
end
