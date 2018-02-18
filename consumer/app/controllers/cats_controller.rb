class CatsController < ApplicationController
  def index
    @cats = ANIMALS.cats.list
  end
end
