class Challenge < ActiveRecord::Base
  before_validation :cache_rendered_markdown

  belongs_to :organizer
  has_many :dataset_files, dependent: :destroy
  accepts_nested_attributes_for :dataset_files, reject_if: :all_blank, allow_destroy: true

  has_many :timelines, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :participant_challenges
  has_many :participants, through: :participant_challenges
  has_many :leaderboards
  has_many :topics

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  accepts_nested_attributes_for :timelines, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :submissions, reject_if: :all_blank, allow_destroy: true TODO cleanup controller

  as_enum :status, [:draft, :running, :completed, :cancelled], map: :string
  validates_presence_of :challenge
  validates_presence_of :status
  validates_presence_of :organizer

  def running?
    return true if status_cd == 'running'
    false
  end

  def start_date
    return Date.yesterday if timelines.empty?
    timelines.first.event_time
  end

  def end_date
    return Date.tomorrow if timelines.empty?
    timelines.last.event_time
  end

  def remaining_text
    time_remaining[0]
  end

  def pct_passed
    time_remaining[1]
  end

  def pct_left
    time_remaining[2]
  end

  def time_remaining
    if running?
      first_milestone = timelines.first
      last_milestone = timelines.last
      challenge_duration = end_date - start_date
      days_left = end_date - Time.now

      pct_left = ((days_left / challenge_duration) * 100).floor
      pct_passed = 100 - pct_left
      remaining_text = if days_left < 1
                         "#{(days_left / 1.day * 24).floor} hours remaining"
                       else
                         "#{(days_left / 1.day).floor} days remaining"
                       end
      return remaining_text, pct_passed, pct_left
    else
      return 'completed', 100, 0
    end
  end

  private

  def cache_rendered_markdown
    if evaluation_markdown_changed?
      self.evaluation_rendered = RenderMarkdown.new.render(evaluation_markdown)
    end
  end
end
