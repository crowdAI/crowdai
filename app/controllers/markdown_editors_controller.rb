class MarkdownEditorsController < ApplicationController
  before_action :authenticate_participant!
  respond_to :js

  def index
    markdown_text = markdown_params[:markdown_text]
    @markdown_text = Kramdown::Document.new(markdown_text,{coderay_line_numbers: nil}).to_html
    render json: { :success => "success", :status_code => "200", data: @markdown_text }
  end

  def presign
    render json: S3Presigner.presign(params[:filename])
  end

  private
  def markdown_params
    params.require(:markdown).permit(:markdown_text)
  end
end
