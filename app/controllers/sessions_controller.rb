class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.find_by(email_address: params[:email_address])
    if new_user && new_user.password == params[:password]
      session[:user_id] = new_user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
