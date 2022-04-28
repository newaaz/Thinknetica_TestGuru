class BaseController < ApplicationController
  layout 'admin'

  before_action :admin_reqired!

  private

  def admin_reqired!
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.admin?
  end
end
