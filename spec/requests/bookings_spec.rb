require "rails_helper"

RSpec.describe "Bookings API", type: :request do
  let(:car)  { create(:car) }
  let(:service) { create(:service) }

  before do
    15.times { create(:booking, car: car, service: service) }
  end

  it "returns paginated bookings" do
    get "/api/v1/bookings?page=1&per_page=10"
    json = JSON.parse(response.body)

    expect(response).to have_http_status(:ok)
    expect(json["data"].length).to eq(10)
    expect(json["meta"]["total_count"]).to eq(15)
  end

  it "creates a booking" do
    post "/api/v1/bookings", params: {
      booking: {
        car_id: car.id,
        service_id: service.id,
        date: Date.tomorrow,
        status: "pending"
      }
    }.to_json,
      headers: { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }

    expect(response).to have_http_status(:created)
  end

  it "gets bookings list" do
    create(:booking, car: car, service: service)

    get "/api/v1/bookings"

    expect(response).to have_http_status(:ok)
  end
end
