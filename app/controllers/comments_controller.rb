class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render 'index'
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body).merge(user: current_user, post: @post))
    if @comment.save
      redirect_to user_post_path(current_user, @post.id)
    else
      render 'new'
    end
  end

  def upvote
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.votes.create
    redirect_to request.referrer
  end

end
