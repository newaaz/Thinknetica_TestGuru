class SessionsController < Devise::SessionsController
  def create
    super
    flash[:info] = "Hello, #{current_user.name}" unless current_user.admin?
  end
end
