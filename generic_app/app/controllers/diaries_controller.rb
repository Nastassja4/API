class DiariesController < ApplicationController

  def new
  end

  def create
    response = HTTParty.post(base_url + "users/#{cookies[:user_id]}/diaries", body: body, headers: headers.merge!("Authorization" => cookies[:auth_token]))
    @diary=response['diary_id']
    redirect_to user_diary_path(cookies[:user_id], @diary)
  end


  def show
    if cookies[:auth_token]
      @response = HTTParty.get(base_url + "users/#{cookies[:user_id]}/diaries/#{params['id']}", headers: headers.merge!("Authorization" => cookies[:auth_token]))
    else
      redirect_to root_path
    end
  end

  def index
    if cookies[:auth_token]
      @diaries = HTTParty.get(base_url + "users/#{cookies[:user_id]}/diaries", headers: headers.merge!("Authorization" => cookies[:auth_token]))
    else
      redirect_to root_path
    end
  end
  private
    def diary_params
      params[:diary]
    end

    def body
      diary_params.to_json
    end
end
