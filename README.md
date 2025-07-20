# Booking Management API

A Rails 7 API backend for a vehicle fleet service booking system. Built for a tech assessment demo with Devise JWT authentication and endpoints for driver bookings, car/service management, and admin review. Includes pagination, serializers, seed data, and full RSpec test coverage.

## 🔧 Tech Stack

- Ruby on Rails 7 (API-only mode)
- PostgreSQL
- Devise + JWT (`devise-jwt`)
- JSON:API-compliant (`jsonapi-serializer`)
- Kaminari (pagination)
- ActionMailer (confirmation emails)
- CORS-enabled (frontend-ready)
- RSpec (tests)

---

## 📦 Features

- Secure JWT-based user authentication
- Driver booking API with:
  - Car selection
  - Service/department selection
  - Date and status
- Admin-ready endpoints for viewing/updating bookings
- Confirmation email sent on booking submission
- JSON:API response formatting
- Pagination for all index endpoints
- Seed file with example cars and services
- Full test coverage for models, controllers, mailer, and pagination

---

## 🚀 Getting Started

### Clone & Setup

```bash
git clone https://github.com/yourusername/booking_management_api.git
cd booking_management_api
bundle install
rails db:create db:migrate db:seed
rails s
```

### Run Tests

```bash
bundle exec rspec
```

## 🔐 Authentication

All endpoints are protected with Devise + JWT.

### Example Header:

```bash
Authorization: Bearer <your-token>
```

## 🌱 Seed Data

Seeds are available in db/seeds.rb. It creates:

- 2 Cars (e.g., Toyota Corolla, Ford Ranger)
- 3 Services (e.g., Maintenance, WOF, Detailing)

## 📬 Mailer

BookingMailer sends a confirmation email to the user when a booking is created.

## 🔁 Pagination

All index endpoints (e.g., /cars, /services, /bookings) support pagination via query params:

```bash
GET /cars?page=1&per_page=10
```

The response includes standard JSON:API meta and links pagination data.

## 🧪 Test Coverage

### RSpec specs include:

- Models
- Mailer (BookingMailer)
- Request specs (Cars, Bookings, Services)
- Pagination specs
- Auth helpers

