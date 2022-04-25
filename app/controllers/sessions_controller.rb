class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      authenticate_user(user)
    else
      flash.now[:warning] = "Something wrong"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = "You are log out"
    redirect_to root_path
  end
end
