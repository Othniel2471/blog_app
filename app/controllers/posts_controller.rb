class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    page = params[:page].to_i || 1
    @per_page = 10

    page = 1 if page < 1

    offset = (@per_page * (page - 1))

    @posts = @user.posts.limit(@per_page).offset(offset)

    @total_posts_count = @user.posts.count
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
