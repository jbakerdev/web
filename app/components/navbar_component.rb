# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  renders_many :links, NavbarLinkComponent
end
