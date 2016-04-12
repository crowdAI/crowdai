class MarkdownEditorController < ApplicationController
  before_filter :authenticate_participant!
  def create
    markdown_text = params[:markdown_text]
    logger.debug("markdown: #{markdown_text}")
    @markdown_text = markdown_text
  end
end
