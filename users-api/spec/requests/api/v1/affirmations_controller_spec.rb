require 'rails_helper'
RSpec.describe Api::V1::AffirmationsController, type: :request do
 let(:user) { create(:user) }
 let(:affirmation) { create(:affirmation) }
 let(:headers) { valid_headers }
 let(:valid_attributes) do
   attributes_for(:affirmation)
 end

 describe 'POST #create' do

    before { post api_v1_user_affirmations_path(user.id), params: valid_attributes.to_json, headers: headers }

    it 'creates a new affirmation' do
      expect(response).to have_http_status(201)
    end

    it 'returns success message' do
      expect(json['message']).to match(/Affirmation created successfully/)
    end

 end


 describe "GET #show" do

   before { get api_v1_user_affirmation_path(user.id, affirmation.id), params: valid_attributes.to_json, headers: headers }

   it "returns http success" do
     expect(response).to have_http_status(:success)
   end
 end


 describe "GET #index" do

   before { get api_v1_user_affirmations_path(user.id), headers: headers }

   it "returns http success" do
     expect(response).to have_http_status(:success)
   end
 end


 describe "GET #update" do

   before { patch api_v1_user_affirmation_path(user.id, affirmation.id), headers: headers }

   it "returns http success" do
     expect(response).to have_http_status(:success)
   end
 end


 describe "GET #delete" do

   before { delete api_v1_user_affirmation_path(user.id, affirmation.id), headers: headers }

   it "returns http success" do
     expect(response).to have_http_status(:success)
   end
 end
end
