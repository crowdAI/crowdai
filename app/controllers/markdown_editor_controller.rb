class MarkdownEditorController < ApplicationController
  def create
    markdown_text = params[:markdown_text]
    logger.debug("markdown: #{markdown_text}")
    @markdown_text = markdown_text
  end
end
