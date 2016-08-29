class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]


  def index
    @query = Article.ransack(params[:q])
    @articles = policy_scope(@query.result)
  end


  def show
    authorize @article
    @article.record_page_view
    @comments = @article.comments
    load_gon
  end


  def new
    @article = Article.new
    authorize @article
  end


  def edit
    authorize @article
    load_gon
  end


  def create
    if current_participant
      @article = current_participant.articles.new(article_params)
    else
      raise Pundit::NotAuthorizedError
    end
    authorize @article

    if @article.save
      @article.article_sections.create!(section: 'Introduction', icon: 'home', seq: 1)
      redirect_to @article
    else
      render :new
    end
  end


  def update
    authorize @article
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end


  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully deleted.'
  end


  private
    def set_article
      @article = Article.friendly.find(params[:id])
      authorize @article
    end


    def article_params
      params.require(:article).permit(:article, :user_id, :published, :category, :summary, :participant_id,
                    article_sections_attributes: [:id, :article_id, :seq, :icon, :section, :description_markdown ],
                    image_attributes: [:id, :image, :_destroy ])
    end
end
