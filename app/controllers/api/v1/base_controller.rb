class Api::V1::BaseController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from AuthenticationError, with: :user_not_authorized
  before_action :authenticate

  # def require_login!
  #   return true if authenticate_partner
  #   render json: { errors: [ { detail: "Access denied" } ] }, status: 401
  # end

  private

  def authenticate
    token = request.headers['Authorization']
    @partner = Partner.find_by!(authen_token: token)

    rescue
      raise AuthenticationError::Unauthorized
  end

  def user_not_authorized(exception)
    render json: {
      error: exception.message,
      status: 401
    }, status: :unauthorized
  end
end
