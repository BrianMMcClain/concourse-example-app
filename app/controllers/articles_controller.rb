class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text))

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
