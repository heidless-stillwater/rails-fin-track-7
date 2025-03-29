class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def stripe_payment; end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :bio, :avatar ])    # new
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :bio, :avatar ])   # edit
  end
end
