class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def edit
  end

  def update
  end

  def destroy
  end
end