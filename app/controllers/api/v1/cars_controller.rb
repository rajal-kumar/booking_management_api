class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: CarSerializer.new(cars).serializable_hash.to_json
  end
end
