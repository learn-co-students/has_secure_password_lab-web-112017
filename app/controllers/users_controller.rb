class UsersController < ApplicationController
  before_action :require_logged_in, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to homepage_url
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
