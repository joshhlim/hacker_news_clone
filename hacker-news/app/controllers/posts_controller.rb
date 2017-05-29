class PostsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @user.posts.create(post_params)

    redirect_to user_posts(@user)
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)

    redirect_to user_posts_path(current_user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :url, :body)
    end
end
