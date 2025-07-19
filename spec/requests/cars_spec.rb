require "rails_helper"

RSpec.describe "Cars API", type: :request do
  it "lists all cars" do
    create(:car)

    get "/api/v1/cars"

    expect(response).to have_http_status(:ok)
  end
end
