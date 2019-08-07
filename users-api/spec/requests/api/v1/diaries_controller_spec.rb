require 'rails_helper'

RSpec.describe Api::V1::DiariesController, type: :request do
  let(:user) { create(:user) }
  let(:diary) { create(:diary) }
  let(:headers) { valid_headers }
  let(:valid_attributes) do
    attributes_for(:diary)
  end

    describe 'POST #create' do
        before { post api_v1_user_diaries_path(user.id), params: valid_attributes.to_json, headers: headers}

          it 'creates a new diary' do
            expect(response).to have_http_status(201)
          end

          it 'returns success message' do
            expect(json['message']).to match(/Diary created successfully/)
          end
      end

      describe 'GET #show' do
        before { get api_v1_user_diary_path(user.id,diary.id), headers: headers }
        it 'returns status 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns title and entry of diary' do
          expect(json['title']).to eq(diary.title)
          expect(json['entry']).to eq(diary.entry)
        end
      end

      describe 'GET #index' do
        before { get api_v1_user_diaries_path(user.id), headers: headers }
        it 'returns status 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
