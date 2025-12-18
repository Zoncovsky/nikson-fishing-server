class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?

  http_basic_authenticate_with name: 'Admin',
    password: 'Password',
    if: :basic_auth_enabled?

  protected

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end

  def basic_auth_enabled?
    Rails.env.in?(%w[production staging development]) && active_admin_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end
end
