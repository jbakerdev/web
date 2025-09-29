# @label Card
# @display bg_color "#fff"
class CardComponentPreview < ViewComponent::Preview
  # Card
  # ---------------
  # The hallmark of a modern web app
  #
  # @label Default
  def default
    render CardComponent.new do
      "This is a card"
    end
  end

  def header
    render CardComponent.new do |c|
      c.with_header do
        "This card has a header"
      end

      "This is a card"
    end
  end

  def header_and_footer
    render CardComponent.new do |c|
      c.with_header do
        "This card has a header"
      end

      c.with_footer do
        "This card has a footer"
      end

      "This is a card"
    end
  end

  def footer
    render CardComponent.new do |c|
      c.with_footer do
        "This card has a footer"
      end

      "This is a card"
    end
  end
end
