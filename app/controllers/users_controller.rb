class UsersController < ApplicationController

  def index
    redirect_to questions_path
  end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      session['user_id'] = @user.id
    else
      render 'new'
    end
  end

  def login
    @user = User.new
  end

  def authenticate
    user = User.find_by(email: params[:user][:email])
    if params[:user][:password_hash] == user.password_hash
      session['user_id'] = user.id
      redirect_to questions_path
    else
      render 'login'
    end
  end

  def destroy
    reset_session
    redirect_to questions_path
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password_hash)
  end

  def login_params
    params.require(:user).permit(:email, :password_hash)
  end

end
