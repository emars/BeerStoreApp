class BeerController < ApplicationController
  def index
    @beer = Beer.find_by_name(params[:name])
  end
end
