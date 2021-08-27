class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image, :department_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image, :username, :department_id])
    end
end
