# @label PageHeading
# @display bg_color "#fff"
class PageHeadingComponentPreview < ViewComponent::Preview
  # PageHeading
  # ---------------
  # Top level heading for a page
  #
  # @label Default
  # @param title text
  def default(title: "This is a PageHeading")
    render PageHeadingComponent.new(title: title)
  end
end
