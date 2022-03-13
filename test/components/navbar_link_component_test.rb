require "test_helper"

class NavbarLinkComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders navbar item" do
    render_inline(NavbarLinkComponent.new(name: "bogus", url: "root_path"))

    assert_selector "a", text: "bogus"
  end

  test "renders navbar item with target" do
    render_inline(NavbarLinkComponent.new(name: "bogus", url: "root_path", target: :_blank))

    assert_selector :xpath, '//a[@target="_blank"]'
  end
end
