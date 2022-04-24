module SessionsHelper
  private

  def authenticate_user!
    unless logged_in?
      store_location
      flash[:info] = "Login, please"
      redirect_to login_path
    end
  end

  def authenticate_user(user)
    log_in user
    flash[:info] = "You are logged"
    forwarding_url = cookies[:forwarding_url]
    redirect_to forwarding_url || tests_path
  end

  def store_location
    cookies[:forwarding_url] = request.original_url if request.get?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    reset_session
    @current_user = nil
  end
end
