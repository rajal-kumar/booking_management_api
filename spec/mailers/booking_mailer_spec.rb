require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  let(:car) { create(:car) }
  let(:service) { create(:service) }
  let(:booking) { create(:booking, car: car, service: service) }

  # it "sends confirmation email" do
  #   # mail = BookingMailer.confirmation_email(user, booking)

  #   expect(mail.subject).to eq("Booking Confirmation")
  #   expect(mail.body.encoded).to match(booking.date.to_s)
  # end
end
