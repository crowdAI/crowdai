require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

=begin
class RenderMarkdown

  def render(text)
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
      disable_indented_code_blocks: false
    }

    renderer = HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
=end

class HTMLRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end



class RenderMarkdown

  def render(text)
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
      disable_indented_code_blocks: false
    }

    renderer = HTMLRenderer.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
