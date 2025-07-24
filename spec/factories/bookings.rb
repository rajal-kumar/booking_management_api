FactoryBot.define do
  factory :booking do
    car
    service
    date { Date.tomorrow }
    status { "pending" }
  end
end
