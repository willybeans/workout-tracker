module Authentication
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user
  end

  private

  def authenticate_user!
    token = request.authorization&.match(/\ABearer (.+)\z/i)&.captures&.first
    user_id = Rails.application.message_verifier(:user_session).verified(
      token,
      purpose: :user_session
    ) if token
    @current_user = User.find_by(id: user_id) if user_id

    head :unauthorized unless @current_user
  end
end
