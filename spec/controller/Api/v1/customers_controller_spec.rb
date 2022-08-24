require 'rails_helper'

RSpec.describe  Api::V1::CustomersController, type: :controller do

	before do 
  	token = JWT.encode({user_data: user.id}, "yoursecretword","HS256")
    request.headers["token"] = token
  end 

  describe '#index' do
  	let(:user) { FactoryBot.create(:user, user_type: 'counsellar') }
    it 'show all counsellar' do
      get :index
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
  	let(:user) { FactoryBot.create(:user, user_type: 'customer') }
  	let(:counsellar) { FactoryBot.create(:user, user_type: 'counsellar') }
    it 'successful response when appointment create' do
      post :create, params: { appointment: {counsellar_id: counsellar.id, customer_id: user.id ,appointment_date: Date.today}}
   	 	response_body = JSON.parse(response.body)
    	expect(response.status).to eq(201)
    end
  end

  describe '#create_feedback' do
  	let(:user) { FactoryBot.create(:user, user_type: 'customer') }
  	let(:counsellar) { FactoryBot.create(:user, user_type: 'counsellar') }
    it 'successful response when feedback_create' do
  		post :create_feedback, params: {  customer_id: user.id, feedback: {description: "dsff", counsellar_id: counsellar.id ,customer_id: user.id}}
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
  	end
  end

  describe '#check_availability' do
  	let(:user) { FactoryBot.create(:user, user_type: 'customer') }
  	it 'successful response when appointment create' do
  		get :check_availability, params: {customer_id: user.id,st: "2022-08-24T12:00", et:"2022-08-24T15:00"}
	  	response_body = JSON.parse(response.body)
	   	expect(response.status).to eq(200)
  	end
  end

  describe '#search' do
  	let(:user) { FactoryBot.create(:user, user_type: 'customer') }
  	let(:counsellar) { FactoryBot.create(:user, user_type: 'counsellar') }
    it 'successful response when search ' do
      get :search, params: { customer_id: user.id, search: counsellar.name }
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end
end
