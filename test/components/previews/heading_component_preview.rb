# @label Heading
# @display bg_color "#fff"
class HeadingComponentPreview < ViewComponent::Preview
  # Heading
  # ---------------
  # Every page needs them!
  #
  # @label Default
  # @param tag select [primary, secondary, success, warning, danger]
  def default(tag: :h2)
    render HeadingComponent.new(tag: tag) do
      "This is a Heading"
    end
  end

  # @!group Tags

  def h1
    render HeadingComponent.new(tag: :h1) do
      "This is a Heading"
    end
  end

  def h2
    render HeadingComponent.new(tag: :h2) do
      "This is a Heading"
    end
  end

  def h3
    render HeadingComponent.new(tag: :h3) do
      "This is a Heading"
    end
  end

  def h4
    render HeadingComponent.new(tag: :h4) do
      "This is a Heading"
    end
  end

  def h5
    render HeadingComponent.new(tag: :h5) do
      "This is a Heading"
    end
  end

  def h6
    render HeadingComponent.new(tag: :h6) do
      "This is a Heading"
    end
  end

  # @!endgroup
end
