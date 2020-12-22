class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery prepend: true

  before_action :update_allowed_parameters, if: :devise_controller?
	skip_before_action :verify_authenticity_token

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :last_name, :birthday, :email, :password, :password_confirmation, :role)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :last_name, :birthday, :email, :password, :current_password, :avatar)}
  end

  def user_not_authorized
    flash[:warning] = 'No se encuentra autorizado para completar esta acción'
    redirect_to root_path || request.referrer
  end


end
