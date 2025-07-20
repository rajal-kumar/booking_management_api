require "rails_helper"

RSpec.describe "Cars API", type: :request do
  let(:user) { create(:user) }
  let(:car)  { create(:car, user: user) }

  before do
    12.times { create(:car, user: user) }
  end

  it "returns paginated cars" do
    get "/api/v1/cars?page=1&per_page=5", headers: auth_headers(user)
    json = JSON.parse(response.body)
    expect(json["data"].length).to eq(5)
  end

  it "lists all cars" do
    get "/api/v1/cars", headers: auth_headers(user)

    expect(response).to have_http_status(:ok)
  end
end
