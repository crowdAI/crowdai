class Comment < ApplicationRecord
  include Mentions
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
      new_mentions = mentions('comment_markdown') - mentions('comment_markdown_before_last_save')
      rendered_html = Kramdown::Document.new(self.comment_markdown,{coderay_line_numbers: nil}).to_html
      self.comment = mentions_to_links(comment_text: rendered_html, mentions: new_mentions)
      #MentionsNotificationsJob.perform_later(mentioned_names: new_mentions, comment_id: self.id)
    end
  end

  def mentioned_participants(mentioned_names:)
    Participant.where(name: mentioned_names).pluck(:name).join('|')
  end

  def mentions_to_links(comment_text:,mentions:)
    comment_text.gsub! /@(#{mentions})/ do |match|
      participant = Participant.find_by(name: match)
      "<a href='/participants/#{participant.slug}'>@#{$1}</a>"
    end
    return comment_text
  end

end
