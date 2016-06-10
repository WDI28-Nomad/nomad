require 'httparty'
class FlightsController < ApplicationController
  before_action :set_sidebar
  skip_before_filter :verify_authenticity_token, :only => :search

  include HTTParty
  format :json

  def index
    
  end

  def search
    token = ENV["SABRE_TOKEN"]
    headers = {
      "Authorization" => "Bearer #{token}"
    }

    flightSearchData = {
      "origin" =>  params[:origin],
      "departuredate" => params[:departuredate],
      "returndate" => params[:returndate],
    }

    endpoint = 'https://api.test.sabre.com/v2/shop/flights/fares'
    @flights = HTTParty.get(endpoint, {query: flightSearchData, headers: headers})
    render json: @flights
  end

  private

  def set_sidebar
    @trip = Trip.new
    @trips = current_user.trips.all.order("created_at")
    @user = current_user
  end

end
