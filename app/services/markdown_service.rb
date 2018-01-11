class MarkdownService

  def initialize(markdown:, mentions_cache: nil)
    @markdown = markdown
    @mentions_cache = JSON.parse(mentions_cache) if mentions_cache.present?
  end

  def call
    return [nil, nil] if @markdown.nil?
    rendered_html = Kramdown::Document.new(@markdown,{coderay_line_numbers: nil}).to_html
    if @mentions_cache.present?
      rendered_html, mention_participant_ids = mentions_to_links(rendered_html: rendered_html, mentions_cache: @mentions_cache)
    end
    return [rendered_html, mention_participant_ids]
  end

  def mentions_to_links(rendered_html:,mentions_cache:)
    mention_participant_ids = []
    mentions_cache.each do |mention|
      rendered_html.gsub! /@(#{mention['name']})/ do |match|
        mention_participant_ids << mention['id']
        "<a href='/participants/#{mention['id']}' target='_blank'>@#{$1}</a>"
      end
    end
    return [rendered_html, mention_participant_ids]
  end

end
