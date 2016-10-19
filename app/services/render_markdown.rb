require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class HTMLRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

class RenderMarkdown

  def render(text)
    return nil if text.nil?

    options = {
      filter_html:          true,
      hard_wrap:            true,
      link_attributes:      { rel: 'nofollow', target: '_blank' }
    }

    extensions = {
      autolink:             true,
      superscript:          true,
      disable_indented_code_blocks: false,
      tables:               true,
      no_intra_emphasis:    true,
      fenced_code_blocks:   true,
      space_after_headers:  true,
      highlight:            true
    }

    renderer = HTMLRenderer.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
