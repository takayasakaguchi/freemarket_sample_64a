class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :nickname, :password, :password_confirmation, :first_name, :last_name, :first_name_reading, :last_name_reading]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

 
end
