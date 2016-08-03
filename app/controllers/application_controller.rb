class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  # def authenticate_user!
  #   if session[:user_id].nil?
  #     flash[:alert] = "You must be signed in to do that."
  #     redirect_to sign_in_path
  #   end
  # end

  helper_method :current_user
end
