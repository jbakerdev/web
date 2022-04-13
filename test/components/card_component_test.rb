require "test_helper"

class CardComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders default card" do
    render_inline CardComponent.new

    assert_selector "div", class: %w[bg-solar4 overflow-hidden shadow rounded-lg divide-y divide-solar2]
  end

  # Scheme

  test "renders card with header" do
    render_inline CardComponent.new do |c|
      c.header "Has a header"
    end

    assert_selector "h3", class: %w[text-lg leading-6 font-medium text-gray-900]
  end

  test "renders card with header and footer" do
    render_inline CardComponent.new do |c|
      c.header "Has a header"
      c.footer "Has a footer"
    end

    assert_selector "h3", class: %w[text-lg leading-6 font-medium text-gray-900]
    assert_selector "div", class: %w[px-4 py-4 sm:px-6]
  end

  test "renders card with footer" do
    render_inline CardComponent.new do |c|
      c.footer "Has a footer"
    end

    assert_selector "div", class: %w[px-4 py-4 sm:px-6]
  end
end
