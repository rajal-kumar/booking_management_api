class Api::V1::ServicesController < ApplicationController
  def index
    render json: Service.all
  end
end
