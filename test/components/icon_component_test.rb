require "test_helper"

class IconComponentTest < ViewComponent::TestCase
  include ViewComponent::TestHelpers

  test "renders default icon" do
    render_inline IconComponent.new(name: "bogus")

    assert_selector "i", class: %w[fas fa-bogus]
  end

  # Scheme

  test "renders solid icon" do
    render_inline IconComponent.new(scheme: :solid, name: "bogus")

    assert_selector "i", class: %w[fas fa-bogus]
  end

  test "renders regular icon" do
    render_inline IconComponent.new(scheme: :regular, name: "bogus")

    assert_selector "i", class: %w[far fa-bogus]
  end

  test "renders light icon" do
    render_inline IconComponent.new(scheme: :light, name: "bogus")

    assert_selector "i", class: %w[fal fa-bogus]
  end

  test "renders brands icon" do
    render_inline IconComponent.new(scheme: :brands, name: "bogus")

    assert_selector "i", class: %w[fab fa-bogus]
  end
end
