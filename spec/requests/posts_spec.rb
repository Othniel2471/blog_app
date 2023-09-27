require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.', posts_counter: 0) }

    it 'returns http success' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'if correct template rendered' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder' do
      get user_posts_path(user)
      expect(response.body).to include("Here's a List of posts for a given user!!")
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let(:post) do
      user.posts.create(title: 'Sample Post', text: 'My first post', comment_counter: 0, likes_counter: 0)
    end

    it 'response status correct' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'if correct template rendered' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder' do
      get user_post_path(user, post)
      expect(response.body).to include("Here's post details for users..")
    end
  end
end
