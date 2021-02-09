class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:kana_family_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:kana_first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:birth_day])
    devise_parameter_sanitizer.permit(:account_update, keys: [:area_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:introduction])
  end
end