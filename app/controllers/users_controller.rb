class UsersController < ApplicationController
  def badges
    @user = User.find params[:id]
    @badges_all = Badge.all
    @user_badges = @user.badges
  end
end
