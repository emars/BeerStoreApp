class BeersController < ApplicationController
  def index
    @beers = Beer.all.order(:name).limit(50)
  end
end
