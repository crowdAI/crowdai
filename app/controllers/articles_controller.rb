class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :disallow_anonymous, except: [:index, :show]

  def index
    if current_participant && current_participant.admin?
      @articles = Article.all
    else
      @articles = Article.where(published: true)
    end
  end


  def show
  end


  def new
    @article = Article.new
  end


  def edit
  end


  def create
    @article = current_participant.articles.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end


  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end


    def article_params
      params.require(:article).permit(:article, :user_id, :published, :category, :summary,
                    article_sections_attributes: [:id, :article_id, :seq, :icon, :section, :description_markdown ])
    end


    def disallow_anonymous
      redirect_to articles_url if !current_participant
    end
end
