class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  
  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :nickname, :password, :password_confirmation, :first_name, :last_name, :first_name_reading, :last_name_reading, :year, :month, :day]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
