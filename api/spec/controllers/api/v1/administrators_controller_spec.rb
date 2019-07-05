# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AdministratorsController, type: :controller do
  let(:user) { create(user_assigned) }
  let(:user_fail) { build(:administrator, email: 'email@failemail.com') }

  context 'without an authenticated user' do
    describe 'GET /api/v1/users' do
      let(:user_assigned) { :administrator }

      it '401 - Unauthorized' do
        get :index
        expect(response.status).to eq(401)
      end

      it '401 - Unauthorized' do
        sign_in(user_fail)
        get :index
        expect(response.status).to eq(401)
      end
    end
  end

  context 'with an authenticated user' do
    let(:user_assigned) { :administrator }
    before { sign_in(user) }

    describe 'GET /api/v1/users' do
      it '200 - OK' do
        get :index
        json_body = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json_body.keys).to match_array(%w[data links])
        expect(json_body['data'][0]['attributes'].keys)
          .to match_array(%w[name email])
      end
    end
  end

  context 'when user not allowed' do
    describe 'GET /api/v1/users' do
      let(:user_assigned) { :employee }

      it '401 - Unauthorized' do
        sign_in(user)
        get :index
        expect(response.status).to eq(403)
      end
    end
  end
end
