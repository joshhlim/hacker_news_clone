class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    current_user.posts.create(post_params)

    redirect_to user_posts_path(current_user)
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)

    redirect_to user_posts_path(current_user)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to user_posts_path(current_user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :url, :body)
    end
end
