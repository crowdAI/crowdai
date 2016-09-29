class ArticleSectionsController < ApplicationController
  before_action :set_article_section, only: [:show, :edit, :update, :destroy]
  before_action :set_article
  after_action :verify_authorized
  respond_to :js, :html


  def show
  end

  def new
    @article_section = @article.article_sections.build(section: 'new section')
    authorize @article_section
  end

  def edit
  end

  def create
    @article_section = @article.article_sections.create(article_section_params)
    authorize @article_section

    if @article_section.save
      render :js => "window.location.href='"+article_path(@article)+"'"   #force a page reload
    else
      render :new
    end
  end

  def update
    if @article_section.update(article_section_params)
      respond_with @article_section
    else
      render :edit
    end
  end

  def destroy
    @article_section.destroy
    redirect_to article_url(@article), notice: 'Article section was successfully destroyed.'
  end

  private
    def set_article
      @article = Article.friendly.find(params[:article_id])
    end


    def set_article_section
      @article_section = ArticleSection.friendly.find(params[:id])
      authorize @article_section
    end

    def article_section_params
      params.require(:article_section).permit!
    end
end
