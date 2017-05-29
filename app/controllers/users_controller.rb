class UsersController < ApplicationController
  def index
  end
  def show
  end
  def new
    @user = User.new
  end
  # def edit
  # end
  def create
    @user = User.new(questions_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  # def update
  # end
  # def destroy
  # end
  private
  def users_params
    params.require(:users).permit(:username,:email,:password_hash)
  end
end
