class NavbarComponentPreview < ViewComponent::Preview
  # Navbar
  # ---------------
  # For getting your nav on
  #
  # @label Default
  def default
    render NavbarComponent.new do |c|
      c.link(name: "Link", url: "")
      c.link(name: "Link (new window)", url: "", target: :_blank)
    end
  end
end
