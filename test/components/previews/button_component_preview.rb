# @label Button
# @display bg_color "#fff"
class ButtonComponentPreview < ViewComponent::Preview
  # Basic button
  # ---------------
  # Just your garden-variety button
  #
  # @label Default
  # @param scheme select [primary, secondary, success, warning, danger]
  # @param size select [sm, md, lg]
  def default(scheme: :primary, size: :medium)
    render ButtonComponent.new(scheme: scheme, size: size) do
      "Click Here"
    end
  end

  # @!group Schemes

  def primary
    render ButtonComponent.new(scheme: :primary) do
      "Click Here"
    end
  end

  def secondary
    render ButtonComponent.new(scheme: :secondary) do
      "Click Here"
    end
  end

  def success
    render ButtonComponent.new(scheme: :success) do
      "Click Here"
    end
  end

  def warning
    render ButtonComponent.new(scheme: :warning) do
      "Click Here"
    end
  end

  def danger
    render ButtonComponent.new(scheme: :danger) do
      "Click Here"
    end
  end

  # @!endgroup

  # @!group Sizes

  def small
    render ButtonComponent.new(size: :sm) do
      "Click Here"
    end
  end

  def medium
    render ButtonComponent.new(size: :md) do
      "Click Here"
    end
  end

  def large
    render ButtonComponent.new(size: :lg) do
      "Click Here"
    end
  end

  # @!endgroup
end
