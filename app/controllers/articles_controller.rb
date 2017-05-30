class ArticlesController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
    @article.make_key
    if  @article.save
      flash[:notice] = "USE THIS URL TO EDIT/DELETE YOUR POST: #{request.original_url}/#{@article.id}/?key=#{@article.key}"
    end  

    redirect_to category_article_url(params[:category_id], @article)
  end  

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to [@category, @article]
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to category_path(@category)
  end    

  private
    def article_params
      params.require(:article).permit(:title, :body, :price, :email, :category_id)
    end

end