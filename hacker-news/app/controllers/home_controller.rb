class HomeController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(session[:user_id])
  end
end