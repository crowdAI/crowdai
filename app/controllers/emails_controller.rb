class EmailsController < InheritedResources::Base

  def index
    @mailer = Mailer.find(params[:mailer_id])
    @search = Email.search(search_params)
    @search.sorts = 'id desc' if @search.sorts.empty?
    @emails = @search.result.page(params[:page]).per(50)
  end

  def show
  end

end
