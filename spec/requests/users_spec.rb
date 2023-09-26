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
    before(:each) do
      get '/users/1'
    end

    it 'response status correct' do
      expect(response).to have_http_status(:success)
    end

    it 'if correct template rendered' do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder' do
      expect(response.body).to include("Here's the details for a user")
    end
  end
end
