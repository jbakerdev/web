# frozen_string_literal: true

class PageHeadingComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
