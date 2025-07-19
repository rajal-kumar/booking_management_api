class Api::V1::CarsController < ApplicationController
  def index
    render json: Car.all
  end
end
