require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:car) { create(:car) }
  let(:service) { create(:service) }
  let(:booking) { create(:booking, user: user, car: car, service: service) }

  it "sends confirmation email" do
    mail = BookingMailer.confirmation_email(user, booking)

    expect(mail.to).to eq([user.email])
    expect(mail.subject).to eq("Booking Confirmation")
    expect(mail.body.encoded).to match(booking.date.to_s)
  end
end
