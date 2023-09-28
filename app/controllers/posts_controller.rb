class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_posts_path(current_user, @post)
      # flash[:notice] = 'Post was successfully added.'
    else
      render :new
      # flash[:alert] = 'Post was not added, all fields are required.'
    end
  end

  # private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
