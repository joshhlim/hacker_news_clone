class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
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
