require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  describe 'login' do
    it 'authenticates the user' do
      post :login, params: { email: user.email, password: '123456', name: user.name, user_type: user.user_type }
      expect(response).to have_http_status(200)
    end
  end
end
