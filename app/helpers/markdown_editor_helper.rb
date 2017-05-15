module MarkdownEditorHelper

  def markdown_editor(placeholder, &block)
    render(
      partial: 'markdown_editor/markdown_editor',
      locals: { placeholder: placeholder, block: block }
    )
  end


  def markdown(text)

    return nil if text.nil?

    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
 end
end
