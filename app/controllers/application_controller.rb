class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :require_login
  protect_from_forgery with: :exception

  

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

end
