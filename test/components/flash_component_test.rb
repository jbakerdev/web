require "test_helper"

class FlashComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders default flash" do
    render_inline FlashComponent.new.with_content("Message")

    assert_selector "div", class: %w[bg-blue]
  end

  # Scheme

  test "renders notice flash" do
    render_inline FlashComponent.new(scheme: :notice).with_content("Message")

    assert_selector "div", class: %w[bg-blue]
  end

  test "renders alert flash" do
    render_inline FlashComponent.new(scheme: :alert).with_content("Message")

    assert_selector "div", class: %w[bg-red]
  end
end
