# @label Flash
# @display bg_color "#fff"
class FlashComponentPreview < ViewComponent::Preview
  # Flash
  # ---------------
  # It's a bird, it's a plane, it's... oh nevermind, it's just the flash...
  #
  # @label Default
  # @param scheme select [notice, alert]
  def default(scheme: :notice, icon: "computer-classic")
    render FlashComponent.new(scheme: scheme) do |c|
      "This is a flash"
    end
  end

  # @!group Schemes

  def notice
    render FlashComponent.new(scheme: :notice) do
      "Something good happened"
    end
  end

  def alert
    render FlashComponent.new(scheme: :alert) do
      "Something bad happened"
    end
  end

  # @!endgroup
end
