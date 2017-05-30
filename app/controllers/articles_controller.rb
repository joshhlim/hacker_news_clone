class ArticlesController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    respond_with(@article)
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
    @article.make_key
    @article.save

    redirect_to category_article_url(params[:category_id], @article)
  end  

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :price, :email, :category_id)
    end

end