class Api::V1::Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  respond_to :json

  def check_token
    bearer_token = request.headers["Authorization"].split(" ")[1]
    if active_session?(bearer_token)
      render json: { active: true }, status: :ok
    else
      render json: { active: false }, status: :unauthorized
    end
  end
  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: "Logged in sucessfully." },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
  private

  def active_session?(bearer_token)
    warden.authenticate(scope: :user, store: false, bearer_token: bearer_token)
  end

end
