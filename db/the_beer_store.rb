require 'nokogiri'
require 'net/http'
require 'json'
require 'uri'


#Class Issues Queries to thebeerstore.ca and grabs info
class TheBeerStore
  BEER_SEARCH_URLS = {
    :ALE_URL => "http://www.thebeerstore.ca/beers/search/beer_type--Ale",
    :LAGER_URL => "http://www.thebeerstore.ca/beers/search/beer_type--Lager",
    :MALT_URL => "http://www.thebeerstore.ca/beers/search/beer_type--Malt",
    :STOUT_URL => "http://www.thebeerstore.ca/beers/search/beer_type--Stout"
  }
  BEER_ROOT_URL = "http://www.thebeerstore.ca/beers/"
  SPECIAL_URL_CASES = {
    "amsterdam oranje summer white" => "amsterdam-oranje-summer-wht"
  }

  def self.get_beer_list
    get_beers_from_web
  end

  def self.get_beers_from_web
    beers = []
    BEER_SEARCH_URLS.each do |type, url|
      doc = get_beer_list_document(url)
      get_beers_from_doc(doc).each do |beer|
        beers << beer
      end
    end

    File.open('beers.txt', 'w+') do |file|
      file.write JSON.generate(beers)
    end
    beers
  end

  def self.get_beer_info (beer_name)
    info = {}
    info[:name] = beer_name
    doc = get_beer_doc(beer_name)
    info[:header] = doc.css("p.introduction").text
    brand_info = doc.css("div.brand-info-inner dd")
    info[:category] = brand_info[0].text
    info[:brewer] = brand_info[1].text
    info[:alc] = brand_info[2].text
    info[:description] = doc.css("div.brand-description p").text
    info
  end

  def self.get_beer_pricing (beer_name)
    beer_prices = []
    doc = get_beer_doc(beer_name)
    pricing = doc.css('table.brand-pricing tbody tr')
    pricing.each do |price|
      price_info = {}
      price_info[:size] = price.css("td.size").text
      price_info[:price] = price.css("td.price").text
      beer_prices << price_info
    end
    parse_pricing(beer_prices)
  end

  private
  def self.get_beer_list_document (url)
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    Nokogiri::HTML(response)
  end

  def self.get_beers_from_doc (doc)
    beers = []
    doc.css('div.item-list ul li').each do |li|
      beers << li.css('span.brand-name').text
    end
    beers
  end

  def self.get_beer_doc (name)
    if SPECIAL_URL_CASES.keys.include?(name.downcase)
      uri = URI.parse(BEER_ROOT_URL + name_to_uri(SPECIAL_URL_CASES[name.downcase]))
    else
      uri = URI.parse(BEER_ROOT_URL + name_to_uri(name))
    end
    response = Net::HTTP.get(uri)
    Nokogiri::HTML(response)
  end

  def self.name_to_uri (name)
    name.split(' ').join('-')
  end

  def self.read_beers_from_file
    beers = JSON.parse(File.read('beers.txt'))
  end

  def self.parse_pricing(prices)
    proper_pricing = []
    prices.each do |price|
      info = {}
      volume_quantity_type = price[:size].split(' ')
      info[:volume] = volume_quantity_type[-1].to_i
      info[:quantity] = volume_quantity_type[0].to_i
      info[:container_type] = volume_quantity_type[2]
      info[:price] = is_on_sale?(price[:price]) ? price[:price].split(' ')[3] : price[:price]
      info[:price] = dollars_to_float(info[:price])
      proper_pricing << info
    end
    proper_pricing
  end

  def self.is_on_sale?(val)
    val.split(' ').length > 1
  end

  def self.dollars_to_float(val)
    val.tr('$','').to_f
  end

  def self.percent_to_float(val)
    val.tr('%', '').to_f
  end
end
