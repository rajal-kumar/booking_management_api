module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        include Devise::Controllers::Helpers

        respond_to :json

        def respond_with(resource, _opts = {})
          token = current_token
          response.set_header('Authorization', "Bearer #{token}")
          render json: { message: 'Logged in successfully.' }, status: :ok
        end

        def respond_to_on_destroy
          head :no_content
        end

        private

        def current_token
          request.env['warden-jwt_auth.token']
        end
      end
    end
  end
end
