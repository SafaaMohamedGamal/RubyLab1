class ApplicationController < ActionController::Base
  alias_method :current_user, :current_author
	# before_action :authenticate_author!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
  end

# def current_ability
#   @current_ability ||= current_author.ability
# end

end
