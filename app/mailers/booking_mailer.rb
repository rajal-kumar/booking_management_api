class BookingMailer < ApplicationMailer
  def confirmation_email(user, booking)
    @user = user
    @booking = booking
    mail(to: @user.email, subject: "Booking Confirmation")
  end
end
