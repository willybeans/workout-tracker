require "test_helper"

module Api
  module V1
    class SessionsControllerTest < ActionDispatch::IntegrationTest
      self.fixture_table_names = []

      setup do
        @user = User.create!(
          username: "runner",
          email: "runner@example.com",
          password: "secure-pass-123"
        )
      end

      test "login returns a token and the authenticated user's identity" do
        post "/api/v1/session", params: {
          email: @user.email,
          password: "secure-pass-123"
        }, as: :json

        assert_response :success
        response_data = response.parsed_body
        assert_not_empty response_data["token"]
        assert_equal @user.id, response_data.dig("user", "id")
      end

      test "login rejects an incorrect password" do
        post "/api/v1/session", params: {
          email: @user.email,
          password: "incorrect"
        }, as: :json

        assert_response :unauthorized
      end

      test "current user requires a valid token and returns its owner" do
        get "/api/v1/me"
        assert_response :unauthorized

        token = Rails.application.message_verifier(:user_session).generate(
          @user.id,
          expires_in: 24.hours,
          purpose: :user_session
        )
        get "/api/v1/me", headers: { "Authorization" => "Bearer #{token}" }

        assert_response :success
        assert_equal @user.id, response.parsed_body.dig("user", "id")
      end

      test "allows the Expo Web origin to preflight login" do
        options "/api/v1/session", headers: {
          "Origin" => "http://localhost:8081",
          "Access-Control-Request-Method" => "POST",
          "Access-Control-Request-Headers" => "content-type"
        }

        assert_response :success
        assert_equal "http://localhost:8081", response.headers["Access-Control-Allow-Origin"]
      end
    end
  end
end
