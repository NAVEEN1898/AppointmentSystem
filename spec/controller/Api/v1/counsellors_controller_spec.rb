require 'rails_helper'

RSpec.describe Api::V1::CounsellorsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:service) { FactoryBot.create(:service, user_id: user.id) }
  let(:appointment) { FactoryBot.create(:appointment, customer_id: user.id) }

  before do
    token = JWT.encode({ user_data: user.id }, 'yoursecretword', 'HS256')
    request.headers['token'] = token
  end

  describe '#create' do
    it 'successful response when services create' do
      post :create, params: { service: { service_name: service.service_name, time: service.time, user_id: user.id } }
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(201)
    end
  end

  describe '#update' do
    it 'successful response when update services ' do
      patch :update, params: { appointment: { advice: appointment.advice, id: appointment.id }, id: appointment.id }
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end
end
