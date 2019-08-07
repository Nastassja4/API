class AffirmationsController < ApplicationController

  def create
    response = HTTParty.post(base_url + "users/#{cookies[:user_id]}/affirmations", body: body, headers: headers.merge!("Authorization" => cookies[:auth_token]))
    @affirmation=response['affirmation_id']
    redirect_to user_affirmation_path(cookies[:user_id], @affirmation)
  end

  def show
    if cookies[:auth_token]
      @response = HTTParty.get(base_url + "users/#{cookies[:user_id]}/affirmations/#{params['id']}", headers: headers.merge!("Authorization" => cookies[:auth_token]))
      @response= @response['affirmation']['note']
    else
      redirect_to root_path
    end
  end

  def index
    if cookies[:auth_token]
      @affirmations = HTTParty.get(base_url + "users/#{cookies[:user_id]}/affirmations", headers: headers.merge!("Authorization" => cookies[:auth_token]))
    else
      redirect_to root_path
    end
  end

  def edit
    response = HTTParty.get(base_url + "users/#{cookies[:user_id]}/affirmations/#{params['id']}", headers: headers.merge!("Authorization" => cookies[:auth_token]))
    @affirmation=response['affirmation']
  end

  def update
    response = HTTParty.patch(base_url + "users/#{cookies[:user_id]}/affirmations/#{params['id']}/", body: body, headers: headers.merge!("Authorization" => cookies[:auth_token]))
    redirect_to user_affirmations_path
  end

  def destroy
    response = HTTParty.delete(base_url + "users/#{cookies[:user_id]}/affirmations/#{params['id']}", headers: headers.merge!("Authorization" => cookies[:auth_token]))
    redirect_to user_affirmations_path
  end

  private
    def affirmation_params
      params[:affirmation]
    end

    def body
      affirmation_params.to_json
    end
end
