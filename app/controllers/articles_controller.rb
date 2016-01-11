class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  
  def index
    @articles = Article.all #.where(created_at: :desc)
  end
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new article_params
    @article.user = User.first
    if @article.save 
      flash[:success] = "Added successfully"
      redirect_to article_path(@article)
    else
      render :new
    end  
  end

  def show
  end

  def edit
  end

  def update
    if @article.update article_params
      flash[:success] = "Updated"
      redirect_to article_path @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article deleted"
    redirect_to articles_path

  end

  private
  def article_params
    params.require(:article).permit :title, :description
  end

  def set_article
    @article = Article.find params[:id]
  end
end
