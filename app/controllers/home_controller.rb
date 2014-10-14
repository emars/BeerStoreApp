class HomeController < ApplicationController
  def index
    @beers = Beer.all
    @count = @beers.count
    @best_5 = find_best_values(5).reverse
    @worst_5 = find_worst_values(5)
    @popular = find_popular_beers
  end

  private
  def find_best_values n
    Beer.all.sort_by do |beer|
      beer.best_value.quantity * beer.best_value.volume / beer.best_value.price
    end[-n..-1]
  end

  def find_worst_values n
    Beer.all.sort_by do |beer|
      beer.best_value.quantity * beer.best_value.volume / beer.best_value.price
    end[0..n]
  end

  def find_popular_beers
    popular_beers = %w{Budweiser Corona Blue Keiths Canadian heineken-nv coors-light}
    Beer.where(:name => popular_beers)
  end
end
