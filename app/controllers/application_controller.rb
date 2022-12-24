class ApplicationController < ActionController::Base
  before_action :set_theme

  def set_theme
    cookies[:user_theme] ||= {value: "dark", path: "/"}
    session[:user_theme] = cookies[:user_theme]
  end
end
