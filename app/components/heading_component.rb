# frozen_string_literal: true

class HeadingComponent < ViewComponent::Base
  DEFAULT_TAG = :h2
  TAG_MAPPINGS = {
    :h1 => "text-4xl mb-10 mt-5",
    DEFAULT_TAG => "text-3xl mb-6",
    :h3 => "text-2xl mb-4",
    :h4 => "text-xl  mb-2",
    :h5 => "text-lg  mb-1",
    :h6 => "text-md"
  }.freeze

  BASE_CSS = %w[
    font-bold
    text-yellow
  ]

  def initialize(tag: DEFAULT_TAG)
    @tag = tag
  end

  def css_classes
    [ TAG_MAPPINGS[@tag], BASE_CSS ].join(" ")
  end

  def call
    content_tag(@tag, content, class: css_classes)
  end
end
