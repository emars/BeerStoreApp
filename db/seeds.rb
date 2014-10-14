# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative 'the_beer_store'
def seed(beers)
  beers.each do |beer|
    puts "Creating new beer #{beer}"
    begin
      beer_info = TheBeerStore.get_beer_info(beer)
      current_beer = Beer.create(beer_info)
      beer_pricing = TheBeerStore.get_beer_pricing(beer)
      beer_pricing.each do |price|
        price[:beer_id] = current_beer.id
        Price.create(price)
      end
    rescue Exception => e
      puts e
      if current_beer
        current_beer.pricing.each do |price|
          price.delte!
        end
        current_beer.delete!
      end
    end
  end
end

def seed_db
  beers = TheBeerStore.get_beer_list
  seed(beers)
end


Beer.delete_all
Price.delete_all
seed_db
#seed(["Budweiser", "Pabst Blue Ribbon", "Heineken-nv",
#  "coors light",
#  "canadian",
#  "bud light",
#  "corona",
#  "blue",
#  "carling lager",
#  "busch lager",
#  "keiths"])
