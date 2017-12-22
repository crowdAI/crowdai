class ChallengeCall < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  has_many :challenge_call_responses
  belongs_to :organizer
  before_save :cache_rendered_markdown

  def should_generate_new_friendly_id?
    title_changed?
  end

  def call_closed?
    self.closing_date.present? && self.closing_date < Time.now.utc
  end

  def cache_rendered_markdown
    if description_markdown_changed?
      self.description = Kramdown::Document.new(self.description_markdown,{coderay_line_numbers: nil}).to_html
    end
  end

end
