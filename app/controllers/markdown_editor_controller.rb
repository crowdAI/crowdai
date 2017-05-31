class MarkdownEditorController < ApplicationController
  before_filter :authenticate_participant!
  respond_to :js

  def show
    markdown_text = markdown_params[:markdown_text]
    @markdown_text = RenderMarkdown.new.render(markdown_text)
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
