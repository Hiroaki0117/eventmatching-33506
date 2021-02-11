class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
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