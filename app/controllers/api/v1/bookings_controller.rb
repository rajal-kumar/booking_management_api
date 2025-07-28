class Api::V1::BookingsController < ApplicationController
  def index
    bookings = Booking.page(params[:page]).per(params[:per_page] || 10)

    render json: BookingSerializer.new(bookings, pagination_links(bookings).merge(include: [:car, :service])).serializable_hash
  end

  def create
    booking = Booking.new(booking_params)

    if booking.save
      # BookingMailer.confirmation_email(current_user, booking).deliver_later
      render json: BookingSerializer.new(booking, include: [:car, :service]).serializable_hash.to_json, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:car_id, :service_id, :date, :status, :user_id)
  end
end
