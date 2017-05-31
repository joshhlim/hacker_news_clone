class PostsController < ApplicationController

  before_action :authorize

  def index
    @posts = User.find(params[:user_id]).posts
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
    @post = Post.new(post_params.merge(user: current_user))
    if @post.save
      redirect_to user_posts_path(@post.user)
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_posts_path(@post.user)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(current_user) }
      format.json { head :no_content }
      format.js { render layout: false}
    end

  end

  def upvote
    @post = Post.find(params[:id])
    @post.votes.create(value: 1)
    redirect_to '/'
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :text)
  end
end
