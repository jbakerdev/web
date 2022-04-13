class ApplicationController < ActionController::Base
  before_action :set_theme

  def set_theme
    session[:user_theme] = cookies[:user_theme] ||= "dark"
  end
end
