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

  as_enum :status, [:draft, :running, :completed, :perpetual, :cancelled], map: :string
  as_enum :grader, [:f1_logloss ], map: :string

  validates_presence_of :status

  validates_presence_of :challenge
  validates_presence_of :organizer

  as_enum :primary_sort_order, [:ascending, :descending], map: :string
  as_enum :secondary_sort_order, [:ascending, :descending, :not_used], map: :string


  def running?
    return true if status_cd == 'running'
    false
  end

  def timeline
    Timeline.new(self)
  end


  def record_page_view
    self.page_views ||= 0
    self.page_views += 1
    self.save
  end


  private
  def cache_rendered_markdown
    if evaluation_markdown_changed?
      self.evaluation = RenderMarkdown.new.render(evaluation_markdown)
    end
    if description_markdown_changed?
      self.description = RenderMarkdown.new.render(description_markdown)
    end
    if rules_markdown_changed?
      self.rules = RenderMarkdown.new.render(rules_markdown)
    end
    if prizes_markdown_changed?
      self.prizes = RenderMarkdown.new.render(prizes_markdown)
    end
    if resources_markdown_changed?
      self.resources = RenderMarkdown.new.render(resources_markdown)
    end
    if dataset_description_markdown_changed?
      self.dataset_description = RenderMarkdown.new.render(dataset_description_markdown)
    end
    if submission_instructions_markdown_changed?
      self.submission_instructions = RenderMarkdown.new.render(submission_instructions_markdown)
    end
  end
end
