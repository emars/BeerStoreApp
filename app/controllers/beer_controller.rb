class BeerController < ApplicationController
  def index
    @beer = Beer.find_by_name(params[:name])
  end


  def search
    if params[:utf8]
      return redirect_to "/beer/search?q="+params[:q]
    end

    query = params[:q]
    @beer = Beer.find_by_name(query)
    @query = params[:q]
    render 'search_result'
    end
end
