class ArticlesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @article = Article.new
    @category = Category.find(params[:category_id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    # article = params[:article]
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(params[:article].permit(:title, :body, :email, :price, :category_id))
    redirect_to category_path(@category)
  end

  def edit
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
    if @article.update(params[:article].permit(:title, :body, :email, :price, :category_id))
      redirect_to [@article.category, @article]
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
    @article.destroy
    redirect_to category_path(@category)
  end
end
