require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/3/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'if correct template rendered' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder' do
      expect(response.body).to include("Here's a List of posts for a given user!!")
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/users/3/posts/1'
    end

    it 'response status correct' do
      expect(response).to have_http_status(:success)
    end

    it 'if correct template rendered' do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder' do
      expect(response.body).to include("Here's post details for users..")
    end
  end
end
