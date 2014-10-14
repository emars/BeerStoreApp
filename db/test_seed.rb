require_relative 'the_beer_store'

info = TheBeerStore.get_beer_info "Amsterdam Oranje Summer White"

info[:pricing].each do |price|
  p price
end