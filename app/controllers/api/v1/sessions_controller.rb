module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_user!, only: :create

      def create
        user = User.find_by("lower(email) = ?", params[:email].to_s.downcase)

        if user&.authenticate(params[:password])
          token = Rails.application.message_verifier(:user_session).generate(
            user.id,
            expires_in: 24.hours,
            purpose: :user_session
          )

          render json: {
            token: token,
            user: user.as_json(only: %i[id username email])
          }
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end
    end
  end
end