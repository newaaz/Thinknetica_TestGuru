class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end

  def send_message
    message = {
      body: params[:body],
      email: params[:email]
    }

    ApplicationMailer.send_message(message).deliver_now
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def rescue_with_record_not_found(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name])
  end

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_tests_path : stored_location_for(resource) || root_path
  end
end
