class Api::V1::BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    bookings = Booking.includes(:car, :service).all
    render json: BookingSerializer.new(bookings, include: [:car, :service]).serializable_hash.to_json
  end

  def create
    booking = current_user.bookings.new(booking_params)
    if booking.save
      BookingMailer.confirmation_email(current_user, booking).deliver_later
      render json: BookingSerializer.new(booking, include: [:car, :service]).serializable_hash.to_json, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:car_id, :service_id, :date, :status)
  end
end
