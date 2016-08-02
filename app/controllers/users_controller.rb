class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_via_token

  def index
    render template: 'users/index.html.erb', locals: {
      users: User.all
    }
  end

  def show
    if User.exists?(params.fetch(:id))
      render template: 'users/show.html.erb', locals: {
        user: User.find(params.fetch(:id))
      }
    else
      render html: "User Not Found", status: 404
    end
  end

  def new
    render locals: {
      user: User.new
    }
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      flash[:alert] = "User could not be created due to errors."
      render template: 'users/new.html.erb', locals: {
        user: user
      }
    end
  end

  def edit
    render locals: {
      user: User.find(params[:id])
    }
  end

  def update
    user = User.find(params.fetch(:id))
    if user.update(user_params)
      redirect_to users
    else
      flash[:alert] = "User could not be updated due to errors."
      render template: 'users/edit.html.erb', locals: {
        user: user
      }
    end
  end

  def destroy
    user = User.find(params.fetch(:id))
    user.destroy
    redirect_to "/users/", :notice => "Your user has been deleted"
  end

  private
  def user_params
    params.requre(:user).permit(:username, :password)
  end

  def authenticate_via_token
    authenticate_or_request_with_http_token do |token, _|
      User.find_by(auth_token: token)
    end
  end
end
