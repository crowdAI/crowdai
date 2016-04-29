class Challenge < ActiveRecord::Base
  before_validation :cache_rendered_markdown

  belongs_to :organizer
  has_many :dataset_files, dependent: :destroy
  accepts_nested_attributes_for :dataset_files, reject_if: :all_blank, allow_destroy: true

  has_many :events, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :leaderboards
  has_many :topics

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :submissions, reject_if: :all_blank, allow_destroy: true TODO cleanup controller

  as_enum :status, [:draft, :running, :completed, :cancelled], map: :string
  validates_presence_of :challenge
  validates_presence_of :status
  validates_presence_of :organizer


  def running?
    return true if status_cd == 'running'
    false
  end

  def timeline
    Timeline.new(self)
  end

  private

  def cache_rendered_markdown
    if evaluation_markdown_changed?
      self.evaluation_rendered = RenderMarkdown.new.render(evaluation_markdown)
    end
  end
end
