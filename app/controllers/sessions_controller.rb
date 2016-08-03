class SessionsController < ApplicationController
  # skip_before_action :authenticate_user!, except: [:destroy]

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed in!"
      redirect_to root_path
    else
      flash[:alert] ="Username or Password were incorrect."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to '/login'
  end

end
