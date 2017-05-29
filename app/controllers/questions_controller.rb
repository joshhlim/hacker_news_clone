class QuestionsController < ApplicationController
  before_action :find_user

  include UserHelper

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @user = User.new
  end

  def edit
    @question = Question.find(params[:id])
    @user = User.new
  end

  def create
    @question = Question.new(questions_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def questions_params
    params.require(:question).permit(:title,:body)
  end

  def find_user
    if logged_in?
      @user = current_user
    else
      @user = User.new
    end
  end

end