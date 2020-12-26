class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # def home; end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up)
    end
end
