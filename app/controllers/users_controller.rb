class UsersController < ApplicationController

  def index
  end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  # def edit
  # end

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

  def update
     find_user
    if @user.authenticate?(user_params)
      session['user_id'] = @user.id
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

end
