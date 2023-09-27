require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'title must be present' do
      post = Post.new(title: '')

      post.valid?

      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'title must be less than 250 characters' do
      post = Post.new(title: 'a' * 251)

      post.valid?

      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'comment_counter must be an integer' do
      post = Post.new(comment_counter: 'a')

      post.valid?

      expect(post.errors[:comment_counter]).to include('is not a number')
    end

    it 'comment_counter must be greater than or equal to 0' do
      post = Post.new(comment_counter: -1)

      post.valid?

      expect(post.errors[:comment_counter]).to include('must be greater than or equal to 0')
    end

    it 'likes_counter must be an integer' do
      post = Post.new(likes_counter: 'a')

      post.valid?

      expect(post.errors[:likes_counter]).to include('is not a number')
    end

    it 'likes_counter must be greater than or equal to 0' do
      post = Post.new(likes_counter: -1)

      post.valid?

      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end
end
