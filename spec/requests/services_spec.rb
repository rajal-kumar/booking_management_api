require "rails_helper"

RSpec.describe "Services API", type: :request do
  before do
    9.times { create(:service) }
  end

  it "returns paginated services" do
    get "/api/v1/services?page=1&per_page=4"

    json = JSON.parse(response.body)
    expect(response).to have_http_status(:ok)
    expect(json["data"].length).to eq(4)
    expect(json["meta"]["total_count"]).to eq(9)
    expect(json["meta"]["total_pages"]).to eq(3)
  end

  it "lists all services" do
    create(:service)

    get "/api/v1/services"

    expect(response).to have_http_status(:ok)
  end
end
