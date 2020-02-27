class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profile_image, :email, :password, :password_confirmation, { tag_ids: [] }])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :profile_image, :email, :password, :password_confirmation, { tag_ids: [] }])
  end

end
