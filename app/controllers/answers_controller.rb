class AnswersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  # def edit
  # end

  def create
  end

  def login
  end

  # def update
  # end

  # def destroy
  # end

  private
  def answer_params
    params.require(:answer).permit(:body,:question_id,:answerer_id)
  end
end
