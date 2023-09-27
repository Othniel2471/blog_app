require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Model' do
    let(:user) { User.create(name: 'yanyan', photo: 'yanyanphoto', bio: 'software developer', posts_counter: 5) }
    let(:post) { Post.create(title: 'test title', text: 'test text', comment_counter: 1, likes_counter: 1) }

    it 'post id must be integer' do
      like = Like.new(user_id: user.id, post_id: post.id)
      like.post_id = nil
      expect(like).to_not be_valid
    end

    it 'user id must be integer' do
      like = Like.new(user_id: user.id, post_id: post.id)
      like.user_id = nil
      expect(like).to_not be_valid
    end
  end
end
