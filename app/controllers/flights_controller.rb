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
    token = "T1RLAQLNph1SRmonSLTk6GTG6U4P6rDG6hChRfItnA8RyrHrdk1mblQQAACgJ5tAmhhlvzAU+XdcMpE2IQcmcbvyjfbRC0XGHq+7mnkWWlsHQooFrEmhct8Kc+HKBKiXYShjoPFljAOAIwklRkMv0dloQLi04FQ+Fg1gK26lZiB6rUEeobr/GfML67z5ThTfaB/OQ3UxduNc8Uar21SK5F/i3RayE7GK1Fdnbg1FiiFDPRQvyPOey0xiXZrTuTQ9BJIUuuZ1CPLpVzCN2Q**"
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
    # render json: @flights
  end

  private

  def set_sidebar
    @trip = Trip.new
    @trips = current_user.trips.all.order("created_at")
    @user = current_user
  end

end
