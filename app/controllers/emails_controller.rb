class MailersController < InheritedResources::Base
  before_action :set_article


  def index
    @search = Result.search(search_params)
    @search.sorts = 'id desc' if @search.sorts.empty?
    @results = @search.result.page(params[:page]).per(50)
  end

  def show
  end

  def

end
