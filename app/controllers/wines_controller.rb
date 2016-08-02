class WinesController < ApplicationController
  def index
    render template: 'wines/index.html.erb', locals: {
      wines: Wines.all
    }
  end

  def show
    if Wine.exists?(id: params.fetch(:id))
      render template: 'wines/show.html.erb', locals: {
        wine: Wine.find(params.fetch(:id))
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      wine: Wine.new
    }
  end

  def create
    wine = Wine.new(wine_params)
    if wine.save
      redirect_to root_path
    else
      flash[:alert] = "Wine could not be created due to errors"
      render template: 'wines/new.html.erb', locals: {
        wine: wine
      }
    end
  end

  def edit
    render loacls: {
      wine: Wine.find(id: params.fetch(:id))
    }
  end

  def update
    wine = Wine.find(id: params.fetch(:id))
    if wine.update(wine_params)
      redirect_to root_path
    else
      # does bulma have alerts?
      flash[:alert] = "Wine could not be edited due to errors."
      render template: 'wines/edit.html.erb', locals: {
        wine: wine
      }
    end
  end

  def destroy
    wine = Wine.find(id: params.fetch(:id))
    wine.destroy
    redirect_to root_path, :notice => "This wine has been deleted"
  end

  private
  def wine_params
    params.require(:wine).permit(:name)
  end

end
