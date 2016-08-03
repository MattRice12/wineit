class UsersController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update]


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
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully created an account and signed in!'
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
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
