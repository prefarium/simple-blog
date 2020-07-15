class ArticlesController < ApplicationController
  include ArticlesHelper


  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: params[:id])
  end


  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article), notice: 'Article is created'
  end


  def destroy
    @article = Article.find(params[:id])

    tags = @article.tags
    tags.each { |tag| tag.destroy if tag.articles.size == 1 }

    @article.destroy

    redirect_to articles_path, notice: 'Article is deleted'
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find params[:id]
    @article.update(article_params)

    redirect_to article_path(@article), notice: 'Article is updated'
  end
end
