class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def new
    @posts = Post.where('updated_at > ?', 30.minutes.ago)
    render 'index'
  end

  def ask
    @posts = Post.all.select {|post| post.title.start_with?("Ask")}
    render 'index'
  end

  def link
    @posts = Post.all.select {|post| post.url.include?('.com' || '.net' || '.org')}
    render 'index'
  end

  def text
    @posts = Post.all.reject {|post| post.url.include?('.com' || '.net' || '.org')}
    render 'index'
  end

  def comments
    @comments = Comment.all
    render 'comment'
  end

end
