class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #call the configured parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  #protect the database while allowing these fields to be updated,
  protected 
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :description, :email, :password, :password_confirmation, :current_password, :remember_me, :user_image, :profile_image) }
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :description, :email, :password, :password_confirmation, :current_password, :remember_me, :user_image, :profile_image) }
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:description, :email, :password, :password_confirmation, :current_password, :remember_me, :image, :profile_image) }
  end
end
