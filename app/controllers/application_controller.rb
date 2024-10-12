class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_theme

  def set_theme
    cookies[:user_theme] ||= { value: "dark", path: "/" }
    session[:user_theme] = cookies[:user_theme]
  end
end
