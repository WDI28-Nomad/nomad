class AirbnbRentalsController < ApplicationController
  def index
    @airbnb_rentals = HTTParty.get('https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&location=Lake%20Tahoe%2C%20CA%2C%20US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164')
      puts @airbnb_rentals.body, @airbnb_rentals.code, @airbnb_rentals.message, @airbnb_rentals.headers.inspect
    render :json => @airbnb_rentals
  end
  # Use the class methods to get down to business quickly


  include HTTParty
  base_uri 'api.airbnb.com'

  # def initialize(service, page)
  #   @options = { query: {site: service, page: page} }
  # end

  # def questions
  #   self.class.get("/2.2/questions", @options)
  # end

  # def users
  #   self.class.get("/2.2/users", @options)
  # end

  # stack_exchange = Airbnb_rental.new("stackoverflow")
  # puts stack_exchange
end
