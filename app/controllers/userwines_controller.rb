class UserwinesController < ApplicationController
  def new
  end

  def create
    Userwine.find_or_create_by(user_id: session[:user_id], wine_id: params["user_id"])
  end

  def destroy
    # favorite = Userwine.where(wine_id: params[:wine_id], user_id: session[:user_id])
    # favorite.destroy
  end
end
