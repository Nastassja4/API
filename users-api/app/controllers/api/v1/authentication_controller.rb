class Api::V1::AuthenticationController < ApplicationController
  # return auth token once user is authenticated
 def authenticate
   auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
   user=User.find_by(email: auth_params[:email])
   json_response(auth_token: auth_token, user_id: user.id)
 end

 private

 def auth_params
   params.permit(:email, :password)
 end
end
