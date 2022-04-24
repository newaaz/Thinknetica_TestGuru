class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  private

  def rescue_with_record_not_found(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end
end
