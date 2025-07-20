class Api::V1::ServicesController < ApplicationController
  def index
    services = Service.all.page(params[:page]).per(params[:per_page] || 10)

    render json: ServiceSerializer.new(services, pagination_links(services)).serializable_hash
  end
end
