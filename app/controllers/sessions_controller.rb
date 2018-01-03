class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      @user = user
      redirect_to homepage_url
    else
      render 'new'
    end
  end

   def destroy
     session.delete(:user_id)
     redirect_to login_path
   end

end
