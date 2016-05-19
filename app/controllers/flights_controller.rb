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
    token = "T1RLAQIVKQAmKgZrUUXD/lRWVftSRsxkOxC8A+wvh5dQ+goaEpTCrBODAACgsJserITFPWsY0aMTHKOQ7Tq9VSBjapruuagLnsBj822hAFm4cPvXvnzhL9X6f2+ueyh4zi/NpA62F/qSuYbmJ8iKk31IaDaqm5nMgn3QN13ifFMxdw41Itk4apHmkd8CREpZT83ysUpk7Wcx28yP5lksuqKlIJ1aT+kDAAzgcA9fSG2R/uUBAjj+VPFzpBJplbNtxCpu1EewtUTZj0b/2Q**"
    headers = {
      "Authorization" => "Bearer #{token}"
    }
    @flight_params = #form params
    endpoint = 'https://api.test.sabre.com/v2/shop/flights/fares'
    @flights = HTTParty.get(endpoint, {query: data, headers: headers})
    # render json: @flights
  end

  private

  def set_sidebar
    @trip = Trip.new
    @trips = current_user.trips.all.order("created_at")
    @user = current_user
  end

end
