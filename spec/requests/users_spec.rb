require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'if correct template rendered' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder' do
      expect(response.body).to include("Here's a list of users")
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.', posts_counter: 0) }

    it 'return If response status was correct' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'return If a correct template was rendered' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'return If the response body includes correct placeholder text' do
      get user_path(user)
      expect(response.body).to include("Here's the details for a user")
    end
  end
end
