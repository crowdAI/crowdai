class Comment < ApplicationRecord
  has_paper_trail
  belongs_to :topic
  belongs_to :participant, optional: true
  has_many :votes, as: :votable
  has_many :notifications, as: :notifiable
  before_save :cache_rendered_markdown

  #default_scope { order('created_at desc') }

  validates :vote_count, presence: true
  validates :comment_markdown, presence: true

  def participant
    super || NullParticipant.new
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
