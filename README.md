# Fleet Booking API

A Rails 7 API backend for a vehicle fleet service booking system. Built for a tech assessment demo with Devise JWT authentication and endpoints for driver bookings, car/service management, and admin review.

## 🔧 Tech Stack

- Ruby on Rails 7 (API-only mode)
- Devise + JWT (`devise-jwt`)
- PostgreSQL
- CORS-enabled for frontend integration (e.g., Angular)
- ActionMailer (confirmation emails)

---

## 📦 Features

- User authentication (login/logout with JWT)
- Driver booking form with:
  - Car selection
  - Service/department selection
  - Date picker
- Admin dashboard-ready endpoints (list + update bookings)
- Booking confirmation email on submit

---

## 🚀 Getting Started

### Clone & Setup

```bash
git clone https://github.com/yourusername/fleet_booking_api.git
cd fleet_booking_api
bundle install
rails db:create db:migrate db:seed
rails s
