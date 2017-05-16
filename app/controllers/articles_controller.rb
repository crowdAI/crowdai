class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:load_more]

  def index
    @query = Article.ransack(params[:q])
    @articles = policy_scope(@query.result)
    authorize @articles
  end


  def show
    @article.record_page_view
    if params[:article_section_id]
      @article_section = ArticleSection.find(params[:article_section_id])
    else
      @article_section = @article.article_sections.first
    end
  end


  def new
    @article = Article.new
    authorize @article
  end


  def edit
  end


  def create
    if current_participant
      @article = current_participant.articles.new(article_params)
      authorize @article
    else
      raise Pundit::NotAuthorizedError
    end

    if @article.save
      @article.article_sections.create!(section: 'Introduction', icon: 'home', seq: 1)
      redirect_to @article
    else
      render :new
    end
  end


  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end


  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully deleted.'
  end

  def articles_filter
    Article::CATEGORIES.sort.map {|k,v| [v,k]}
  end

  def load_more
    @articles = policy_scope(Article)
    render js: concept("article/cell/list", @articles, page: params[:page]).(:append)
  end


  private
    def set_article
      @article = Article.friendly.find(params[:id])
      authorize @article
    end


    def article_params
      params.require(:article).permit(:article, :user_id, :published, :category, :summary, :participant_id, :image_file,
                    article_sections_attributes: [:id, :article_id, :seq, :icon, :section, :description_markdown ],
                    image_attributes: [:id, :image, :_destroy ])
    end
end
