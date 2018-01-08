class MarkdownService

  def initialize(markdown:, markdown_old: nil, mentions_cache: nil)
    @markdown = markdown
    @mentions_cache = JSON.parse(mentions_cache) if mentions_cache.present?
  end


  def call

    return [rendered_html,mentioned_participant_ids]
  end

  def cache_rendered_markdown
    if comment_markdown_changed?
      rendered_html = Kramdown::Document.new(self.comment_markdown,{coderay_line_numbers: nil}).to_html
      new_mentions = JSON.parse(self.mentions_cache)
      self.mentions_cache = nil
      self.comment, mentioned_participant_ids = mentions_to_links(rendered_html: rendered_html, mentions: new_mentions)
      MentionsNotificationsJob.perform_later(mentioned_participant_ids: mentioned_participant_ids, comment_id: self.id)
    end
  end

  def mentions_to_links(rendered_html:,mentions:)
    mention_participant_ids = []
    mentions.each do |mention|
      rendered_html.gsub! /@(#{mention['name']})/ do |match|
        mention_participant_ids << mention['id']
        "<a href='/participants/#{mention['id']}' target='_blank'>@#{$1}</a>"
      end
    end
    return [rendered_html, mention_participant_ids]
  end

end
