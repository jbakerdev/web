class NavbarComponentPreview < ViewComponent::Preview
  # Navbar
  # ---------------
  # For getting your nav on
  #
  # @label Default
  def default
    render NavbarComponent.new do |c|
      c.with_link(name: "Link", url: "")
      c.with_link(name: "Link (new window)", url: "", target: :_blank)
    end
  end
end
