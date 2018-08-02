class ArticlesController < ApplicationController
  before_action :authenticate_participant!,
    except: [:show,:index]
  before_action :set_article,
    only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @articles = policy_scope(Article)
      .page(params[:page])
      .per(10)
    authorize @articles
  end


  def show
    @article.record_page_view
    if params[:article_section_id]
      @article_section = ArticleSection
        .find(params[:article_section_id])
    else
      @article_section = @article.article_sections.first
      if @article.notebook_url.present?
        @notebook_data = NotebookService.new(
          notebook_url: @article.notebook_url).call
      end
    end
  end


  def new
    @article = Article.new
    authorize @article
  end

  def edit
  end

  def create
    @article = current_participant.articles.new(
      article_params.merge(participant_id: current_participant.id))
    authorize @article

    if @article.save
      unless @article.notebook_url.present?
        @article.article_sections.create!(section: 'Intro')
      end
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

  def remove_image
    @article = Article.friendly.find(params[:article_id])
    authorize @article
    @article.remove_image_file!
    @article.save
    redirect_to edit_article_path(@article), notice: 'Image removed.'
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
      authorize @article
    end

    def article_params
      params
        .require(:article)
        .permit(
          :article,
          :published,
          :category,
          :summary,
          :image_file,
          :notebook_url,
          article_sections_attributes: [
            :id,
            :article_id,
            :seq,
            :icon,
            :section,
            :description_markdown ],
          image_attributes: [
            :id,
            :image,
            :_destroy ])
    end
end
