class ApplicationController < ActionController::Base
  include Authentication

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_theme

  def set_theme
    cookies[:user_theme] ||= { value: "dark", path: "/" }
    session[:user_theme] = cookies[:user_theme]
  end
end
