require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'name must be present' do
      user = User.new(name: '')

      user.valid?

      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'post_counter must be an integer' do
      user = User.new(post_counter: 'a')

      user.valid?

      expect(user.errors[:post_counter]).to include('is not a number')
    end

    it 'post_counter must be greater than or equal to 0' do
      user = User.new(post_counter: -1)

      user.valid?

      expect(user.errors[:post_counter]).to include('must be greater than or equal to 0')
    end

    it 'returns three recent posts' do
      user = User.create(name: 'otsama', photo: 'photo', bio: 'software developer', post_counter: 5)
      post1 = Post.create(title: 'test title', text: 'test text', comments_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post2 = Post.create(title: 'test title', text: 'test text', comments_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post3 = Post.create(title: 'test title', text: 'test text', comments_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post4 = Post.create(title: 'test title', text: 'test text', comments_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post5 = Post.create(title: 'test title', text: 'test text', comments_counter: 1, likes_counter: 1,
                          author_id: user.id)
      post6 = Post.create(title: 'test title', text: 'test text', comments_counter: 1, likes_counter: 1,
                          author_id: user.id)

      expect(user.recent_posts).to eq([post6, post5, post4])
    end
  end
end