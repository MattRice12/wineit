class WinesController < ApplicationController
  def index
    render template: 'wines/index.html.erb', locals: {
      wines: Wine.all,
    }
  end

  def show
    Wine.find_by(id: params.fetch(:id))
    render template: 'wines/show.html.erb', locals: {
      wine: Wine.find(params.fetch(:id))
    }
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
    wine = Wine.find_by(id: params.fetch(:id))
    render locals: {
      wine: wine
    }
  end

  def update
    wine = Wine.find_by(id: params.fetch(:id))
    if wine.update(wine_params)
      redirect_to wines_path, notice: 'Wine was successfully updated'
    else
      flash[:alert] = "Wine could not be edited due to errors."
      render template: 'wines/edit.html.erb', locals: {
        wine: wine
      }
    end
  end

  def destroy
    wine = Wine.find_by(id: params.fetch(:id))
    wine.destroy
    redirect_to root_path, :notice => "This wine has been deleted"
  end

  private
  def wine_params
    params.require(:wine).permit(:name)
  end

end
