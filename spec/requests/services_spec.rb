require "rails_helper"

RSpec.describe "Services API", type: :request do
  it "lists all services" do
    create(:service)

    get "/api/v1/services"

    expect(response).to have_http_status(:ok)
  end
end
