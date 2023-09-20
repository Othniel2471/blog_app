class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :user
  belongs_to :post

  after_save :update_likes

  private

  def update_likes
    post.update(likes_counter: post.likes.count)
  end
end
