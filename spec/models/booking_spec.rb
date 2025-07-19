require "rails_helper"

RSpec.describe Booking, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:car) }
  it { should belong_to(:service) }

  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:status) }
end
