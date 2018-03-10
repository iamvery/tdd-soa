class CatsController < ApplicationController
  def index
    @cats = ANIMALS.cats.list
  end

  def create
    ANIMALS.cats.create(cat_params)
    redirect_to cats_path
  end

  def destroy
    ANIMALS.cats.delete(params[:id])
    redirect_to cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age)
  end
end
