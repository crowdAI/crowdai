class Challenge < ActiveRecord::Base
  before_validation :cache_rendered_markdown

  belongs_to :organizer
  has_many :dataset_files, dependent: :destroy
  accepts_nested_attributes_for :dataset_files, reject_if: :all_blank, allow_destroy: true

  has_many :events, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :leaderboards
  has_many :participant_challenges
  has_many :topics

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :submissions, reject_if: :all_blank, allow_destroy: true TODO cleanup controller

  as_enum :status, [:draft, :running, :completed, :cancelled], map: :string
  validates_presence_of :status

  validates_presence_of :challenge
  validates_presence_of :organizer

  as_enum :score_sort, [:ascending, :descending], map: :string
  validates :score_sort, presence: true
  as_enum :score_secondary_sort, [:ascending, :descending, :not_used], map: :string
  validates :score_secondary_sort, presence: true


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
    if description_markdown_changed?
      self.description_rendered = RenderMarkdown.new.render(description_markdown)
    end
    if rules_markdown_changed?
      self.rules_rendered = RenderMarkdown.new.render(rules_markdown)
    end
    if prizes_markdown_changed?
      self.prizes_rendered = RenderMarkdown.new.render(prizes_markdown)
    end
    if resources_markdown_changed?
      self.resources_rendered = RenderMarkdown.new.render(resources_markdown)
    end
    if dataset_description_markdown_changed?
      self.dataset_description_rendered = RenderMarkdown.new.render(dataset_description_markdown)
    end
    if submission_instructions_markdown_changed?
      self.submission_instructions_rendered = RenderMarkdown.new.render(submission_instructions_markdown)
    end
  end
end
