class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def login
  end

  # def update
  # end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:body,:answerer_id,:question_id)
  end
end
