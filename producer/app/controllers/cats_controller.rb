class CatsController < ApplicationController
  def index
    cats = Cat.all
    render json: CatSerializer.new(cats)
  end
end
