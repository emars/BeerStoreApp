class BeersController < ApplicationController
  def index
    @beers = Beer.all.order(:name).limit(50)
  end

  def search
    if params[:utf8]
      redirect_to "/beer/search/"+param[:q]
    end
  end
end
