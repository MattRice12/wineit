class UserwinesController < ApplicationController
  def new
  end

  def create
    Userwine.create!(user_id: params[:user_id], wine_id: params[:wine_id])
  end

  def destroy
  end
end
