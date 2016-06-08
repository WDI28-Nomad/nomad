require 'httparty'
class FlightsController < ApplicationController
  before_action :set_sidebar

  include HTTParty
  format :json

  def flight_params
    # TODO: don't need this
    @flight_params = {
      "origin" => nil,
      "departuredate" => nil,
      "returndate" => nil,
      "maxfare" => nil,
      "pointofsalecountry" => nil
    }
  end

  def index
  end

  def search
    p "flight params are #{params}"
    token = ENV["SABRE_KEY"]
    headers = {
      "Authorization" => "Bearer #{token}"
    }
    endpoint = 'https://api.test.sabre.com/v2/shop/flights/fares'
    @flights = HTTParty.get(endpoint, {query: params, headers: headers})
    # render json: @flights
  end

  private

  def set_sidebar
    @trip = Trip.new
    @trips = current_user.trips.all.order("created_at")
    @user = current_user
  end

end
