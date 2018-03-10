class CatsController < ApplicationController
  def index
    cats = Cat.all
    render json: CatSerializer.new(cats)
  end

  def create
    cat = Cat.create!(cat_params)
    render json: CatSerializer.new(cat), status: 201
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy!
    head 204
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age)
  end
end
