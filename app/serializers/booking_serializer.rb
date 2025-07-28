class BookingSerializer
  include JSONAPI::Serializer

  attributes :date, :status

  belongs_to :car
  belongs_to :service
  belongs_to :user
end
