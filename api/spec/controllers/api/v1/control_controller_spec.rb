# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ControlController, type: :controller do
  let(:admin) { create(:user) }
  let(:user_fail) { build(:user, email: 'email@failemail.com') }
  let(:employee) { build(:user, role: 1) }

  context 'without an authenticated user' do
    describe 'GET /api/v1/control' do
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
    before { sign_in(admin) }

    describe 'GET /api/v1/control' do
      it '200 - OK' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  context 'when user not allowed' do
    describe 'GET /api/v1/control' do
      it '401 - Unauthorized' do
        sign_in(employee)
        get :index
        expect(response.status).to eq(401)
      end
    end
  end
end
