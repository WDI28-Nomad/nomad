class AirbnbListingsController < ApplicationController
  def index
    @airbnb_listings = HTTParty.get('https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&location=Lake%20Tahoe%2C%20CA%2C%20US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164')
      puts @airbnb_listings.body, @airbnb_listings.code, @airbnb_listings.message, @airbnb_listings.headers.inspect
    render :json => @airbnb_listings
  end
end
