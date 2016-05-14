class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :current_city, :password])
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :username, :avatar, :current_city, :password, :current_password) }
  end

  def after_sign_in_path_for(resource)
    current_user
  end
end
