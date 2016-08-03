class UserwinesController < ApplicationController
  def new
  end

  def create
    Userwine.create!(user_id: session[:user_id], wine_id: params["user_id"])
  end

  def destroy
  end
end
