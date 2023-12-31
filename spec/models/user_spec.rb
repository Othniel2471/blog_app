require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'name must be present' do
      user = User.new(name: '')

      user.valid?

      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'posts_counter must be an integer' do
      user = User.new(posts_counter: 'a')

      user.valid?

      expect(user.errors[:posts_counter]).to include('is not a number')
    end

    it 'posts_counter must be greater than or equal to 0' do
      user = User.new(posts_counter: -1)

      user.valid?

      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end

    it 'returns three recent posts' do
      user = User.create(name: 'otsama', photo: 'photo', bio: 'software developer', posts_counter: 5)
      post4 = Post.create(title: 'test title 4', text: 'test text', comment_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post5 = Post.create(title: 'test title 5', text: 'test text', comment_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post6 = Post.create(title: 'test title 6', text: 'test text', comment_counter: 1, likes_counter: 1,
                          author_id: user.id)

      expect(user.recent_posts).to eq([post6, post5, post4])
    end
  end
end
