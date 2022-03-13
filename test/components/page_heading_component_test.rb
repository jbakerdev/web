require "test_helper"

class PageHeadingComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders page heading" do
    render_inline(PageHeadingComponent.new(title: "bogus"))

    assert_selector "h1", text: "bogus"
  end
end
