class Api::V1::CarsController < ApplicationController
  def index
    cars = current_user.cars.page(params[:page]).per(params[:per_page] || 10)

    render json: CarSerializer.new(cars, pagination_links(cars)).serializable_hash
  end
end
