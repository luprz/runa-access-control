# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AdministratorsController, type: :controller do
  let(:user) { create(user_assigned) }

  context 'without an authenticated user' do
    describe 'GET /api/v1/administrators' do

      it '401 - Unauthorized' do
        get :index
        expect(response.status).to eq(401)
      end
    end

    describe 'POST /api/v1/administrators' do
      it '401 - Unauthorized' do
        post :create
        expect(response.status).to eq(401)
      end
    end
  end

  context 'with an authenticated user' do
    let(:user_assigned) { :administrator }
    before do
      sign_in(user)
    end

    describe 'GET /api/v1/administrators' do
      before do
        mock = double(index?: true)

        expect(AdministratorPolicy)
          .to receive(:new)
          .with(user: user)
          .once
          .and_return(mock)
      end

      it '200 - OK' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe 'POST /api/v1/administrators' do
      before do
        mock = double(create?: true)

        expect(AdministratorPolicy)
          .to receive(:new)
          .with(user: user)
          .once
          .and_return(mock)

        post :create, params: {
          administrator: {
            name: 'Sr. Admin',
            email: 'admin@gmail.com',
            position: 'RRHH',
            password: '12345678'
          }
        }
      end

      it '201 - CREATED' do
        expect(response.status).to eq(201)
      end
      
      it 'return an administrator object' do
        json_body = JSON.parse(response.body)
        expect(json_body.dig('data', 'type')).to eq('administrators')
      end
    end
  end
end
