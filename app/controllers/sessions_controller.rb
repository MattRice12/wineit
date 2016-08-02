class SessionsController < ApplicationController
  def authenticate
    user = User.find_by(username: params.fetch(:username))
    if user.present? && user.authenticate(params.fetch(:password))
      redirect_to root_path
    else
      flash[:alert] ="Email or Password were incorrect."
      render template: "sessions/new", status: :unauthorized
    end
  end
end
