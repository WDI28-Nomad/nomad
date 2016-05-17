require 'httparty'
class FlightsController < ApplicationController

  include HTTParty
  format :json

  def index
    @flights = HTTParty.get('https://api.test.sabre.com/v2/shop/flights/fares?origin=JFK&departuredate=2016-05-20&returndate=2016-05-27&maxfare=300&pointofsalecountry=US')
  end
end
