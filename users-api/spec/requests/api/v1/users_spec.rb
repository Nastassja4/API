require 'rails_helper'

RSpec.describe 'Api::V1::Users API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  describe '#show' do
    before { get '/api/v1/user', headers: headers }

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns name and email of current_user' do
      expect(json['name']).to eq(user.name)
      expect(json['email']).to eq(user.email)
    end
  end
end
