require 'httparty'
class FlightsController < ApplicationController
  before_action :set_sidebar

  include HTTParty
  format :json

  def flight_params
    @flight_params = {
      "origin" => nil,
      "departuredate" => nil,
      "returndate" => nil,
      "maxfare" => nil,
      "pointofsalecountry" => nil
    }
  end

  def search
    token = ENV['SABRE_TOKEN']
    headers = {
      "Authorization" => "Bearer #{token}"
    }
    data = {
      "origin" => "SFO",
      "departuredate" => "2016-06-08",
      "returndate" => "2016-06-14",
      "maxfare" => nil,
      "pointofsalecountry" => nil
    }
    endpoint = 'https://api.test.sabre.com/v2/shop/flights/fares'
    @flights = HTTParty.get(endpoint, {query: data, headers: headers})
    render json: @flights
  end

  private

  def set_sidebar
    @trip = Trip.new
    @trips = current_user.trips.all.order("created_at")
    @user = current_user
  end

end
