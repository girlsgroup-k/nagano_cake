class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #サインイン後の遷移先
    root_path
  end

  def after_sign_out_path_for(resource) #サインアウト後の遷移先
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone_number])
  end
end
