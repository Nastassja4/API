class UsersController < ApplicationController
  def signup_page
  end

  def signup
    response = HTTParty.post(base_url + "signup", body: body, headers: headers)
    cookies[:auth_token] = response['auth_token']
    cookies[:user_id] = response['user_id']
    binding.pry
    redirect_to show_path
  end

  def login_page
    cookies.delete :auth_token
    cookies.delete :user_id
  end

  def login
    response = HTTParty.post(base_url + "auth/login", body: body, headers: headers)
    if response['auth_token']
      cookies[:auth_token] = response['auth_token']
      cookies[:user_id] = response['user_id']
      redirect_to show_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    if cookies[:auth_token]
      @response = HTTParty.get(base_url + "user", headers: headers.merge!("Authorization" => cookies[:auth_token]))
    else
      redirect_to root_path
    end
  end

private
  def signup_params
    params[:anything]
  end

  def body
    signup_params.to_json
  end

end
