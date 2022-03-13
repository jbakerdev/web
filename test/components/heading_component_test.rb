require "test_helper"

class HeadingComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders default heading" do
    render_inline HeadingComponent.new

    assert_selector "h2", class: %w[text-3xl mb-6]
  end

  # Tag

  test "renders h1 heading" do
    render_inline HeadingComponent.new(tag: :h1)

    assert_selector "h1", class: %w[text-4xl mb-10 mt-5]
  end

  test "renders h2 heading" do
    render_inline HeadingComponent.new(tag: :h2)

    assert_selector "h2", class: %w[text-3xl mb-6]
  end

  test "renders h3 heading" do
    render_inline HeadingComponent.new(tag: :h3)

    assert_selector "h3", class: %w[text-2xl mb-4]
  end

  test "renders h4 heading" do
    render_inline HeadingComponent.new(tag: :h4)

    assert_selector "h4", class: %w[text-xl mb-2]
  end

  test "renders h5 heading" do
    render_inline HeadingComponent.new(tag: :h5)

    assert_selector "h5", class: %w[text-lg  mb-1]
  end

  test "renders h6 heading" do
    render_inline HeadingComponent.new(tag: :h6)

    assert_selector "h6", class: %w[text-md]
  end
end
