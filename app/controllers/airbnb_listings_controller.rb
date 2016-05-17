require 'httparty'
class AirbnbListingsController < ApplicationController
  include HTTParty
  format :json
    ## Variable we want to dynamically change
    # @location = 'location=Los%20Angeles%2C%20CA'

    def index
      #Hard coded Lake Tahoe 
      @airbnb_listings = HTTParty.get('https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&_limit=10&_offset=0&fetch_facets=true&guests=1&ib=false&ib_add_photo_flow=true&location=Lake%20Tahoe%2C%20CA%2C%20US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164')
    end
end

  ##Nathan's Solution
  # location = "San Francisco, CA"
  #
  # options = {
  #   query: {
  #     client_id: "3092nxybyb0otqw18e8nh5nty",
  #     locale: "en-US",
  #     currency: "USD",
  #     _format: "for_search_results_with_minimal_pricing",
  #     min_bathrooms: "0",
  #     min_bedrooms: "0",
  #     min_beds: "1",
  #     min_num_pic_urls: "10",
  #     price_max: "210",
  #     price_min: "40",
  #     sort: "1",
  #     user_lat: "37.3398634",
  #     user_lng: "-122.0455164",
  #     location: URI.encode(location)
  #   }
  # }
  # @airbnb_listings = HTTParty.get('https://api.airbnb.com/v2/search_results', options)
  # end
