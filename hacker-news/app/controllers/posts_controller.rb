class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

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
      redirect_to posts_user_path(current_user)
    else
      render 'new'
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_user_path(current_user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :url, :body)
    end
end
