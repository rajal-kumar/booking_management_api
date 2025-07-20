FactoryBot.define do
  factory :car do
    make { "Toyota" }
    model { "Corolla" }
    rego { "ABC123" }
    association :user
  end
end
