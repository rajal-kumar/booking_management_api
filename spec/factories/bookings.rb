FactoryBot.define do
  factory :booking do
    user
    car
    service
    date { Date.tomorrow }
    status { "pending" }
  end
end
