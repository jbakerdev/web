# @label Icon
# @display bg_color "#fff"
class IconComponentPreview < ViewComponent::Preview
  # Icon
  # ---------------
  # Because a picture is worth 1000 words, but images are too much work
  #
  # @label Default
  # @param scheme select [solid, regular, light, duotone]
  # @param size select [sm, md, lg]
  # @param name text
  def default(scheme: :solid, size: :md, name: "computer-classic")
    render IconComponent.new(scheme: scheme, size: size, name: name)
  end

  # @!group Schemes

  def solid
    render IconComponent.new(scheme: :solid, name: "computer-classic")
  end

  def regular
    render IconComponent.new(scheme: :regular, name: "computer-classic")
  end

  def light
    render IconComponent.new(scheme: :light, name: "computer-classic")
  end

  def duotone
    render IconComponent.new(scheme: :duotone, name: "computer-classic")
  end

  # @!endgroup

  # @!group Sizes

  def small
    render IconComponent.new(size: :sm, name: "computer-classic")
  end

  def medium
    render IconComponent.new(size: :md, name: "computer-classic")
  end

  def large
    render IconComponent.new(size: :lg, name: "computer-classic")
  end

  # @!endgroup

end
