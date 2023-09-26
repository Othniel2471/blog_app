class PostsController < ApplicationController
  def show
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
  end

  def index
    @users = User.find(params[:user_id])
    @post = @users.posts
  end
end
