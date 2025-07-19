require "rails_helper"

RSpec.describe "Bookings API", type: :request do
  let(:user) { create(:user) }
  let(:car) { create(:car) }
  let(:service) { create(:service) }

  it "creates a booking" do
    post "/api/v1/bookings", params: {
      booking: {
        car_id: car.id,
        service_id: service.id,
        date: Date.tomorrow,
        status: "pending"
      }
    }.to_json, headers: auth_headers(user).merge("Content-Type" => "application/json")

    expect(response).to have_http_status(:created)
  end

  it "gets bookings list" do
    create(:booking, user: user, car: car, service: service)

    get "/api/v1/bookings", headers: auth_headers(user)

    expect(response).to have_http_status(:ok)
  end
end
