class ArticlesController < ApplicationController

  def create
    @article = Article.new(article_params)
    @article.make_key
    puts @article
    @article.save
    redirect_to @arti
  end  

  def show
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :price, :email)
    end

end