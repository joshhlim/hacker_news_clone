class ArticlesController < ApplicationController
  def index
    @articles = Article.order(id: :desc).limit(20)
  end

  def new
    @article = Article.new
  end

  def create
    @category = Category.find_or_create_by(name: params[:article][:category])
    @article = Article.new(article_params)
    @article.category_id = @category.id

    if @article.save
      @key = @article.edit_url
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    extension = params[:key]

    if extension && @article.edit_url == extension
      render 'edit'
    else
      render 'show'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:subject, :body, :email, :price, :edit_url)
  end
end
