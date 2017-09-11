module MarkdownEditorHelper

  def markdown_editor(&block)
    render(
      partial: 'markdown_editor/markdown_editor',
      locals: { block: block }
    )
  end

end
