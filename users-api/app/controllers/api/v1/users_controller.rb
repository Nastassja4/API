class Api::V1::UsersController < Api::V1::AuthenticatedController
  def show
    response = { name: current_user.name, email: current_user.email, user_id: current_user.id }
    json_response(response)
  end
end
