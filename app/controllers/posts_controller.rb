class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params['id'])
  end

  def index
    @posts = Post.all
  end
end
