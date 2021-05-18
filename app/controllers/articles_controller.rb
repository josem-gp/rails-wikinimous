class ArticlesController < ApplicationController
  #READ
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  #CREATE
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(restaurant_params)
    @article.save

    redirect_to article_path(@article)
  end
  # UPDATE
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(restaurant_params)

    redirect_to article_path(@article)
  end
  # DELETE
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def restaurant_params
    params.require(:article).permit(:title, :content)
  end
end
