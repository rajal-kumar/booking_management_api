class CarSerializer
  include JSONAPI::Serializer
  attributes :make, :model, :rego
end
