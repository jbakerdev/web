require "test_helper"

class NavbarComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders navbar" do
    render_inline(NavbarComponent.new)

    assert_selector "nav"
  end
end
