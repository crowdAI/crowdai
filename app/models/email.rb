class Email < ApplicationRecord
  belongs_to :challenge, optional: true


  def index
    @search = Email.search(search_params)
    @search.sorts = 'id desc' if @search.sorts.empty?
    @results = @search.result.page(params[:page]).per(50)
  end

  def show
  end


  as_enum :status, [:sent, :mandrill_sent, :mandrill_bounced], map: :string
end
