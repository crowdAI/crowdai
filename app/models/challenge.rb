class Challenge < ApplicationRecord
  include FriendlyId

  friendly_id :challenge, use: [:slugged, :finders, :history]
  before_save :cache_rendered_markdown
  before_save :reset_featured_seq
  validate :valid_status
  belongs_to :organizer
  has_many :dataset_files, dependent: :destroy
  mount_uploader :image_file, ImageUploader

  has_many :submission_file_definitions,  dependent: :destroy, inverse_of: :challenge
  accepts_nested_attributes_for           :submission_file_definitions,
                                          reject_if: :all_blank,
                                          allow_destroy: true

  has_many :submissions,                  dependent: :destroy
  has_many :leaderboards,                 class_name: 'Leaderboard'
  has_many :ongoing_leaderboards,         class_name: 'OngoingLeaderboard'
  has_many :participant_challenges,       class_name: 'ParticipantChallenge'
  has_many :topics
  has_many :votes,                        as: :votable
  has_many :follows,                      as: :followable
  has_many :challenge_rounds,             dependent: :destroy, inverse_of: :challenge
  accepts_nested_attributes_for           :challenge_rounds,
                                          reject_if: :all_blank,
                                          allow_destroy: true
  has_many :challenge_round_summaries

  as_enum :status, [:draft, :running, :completed, :terminated, :starting_soon], map: :string
  as_enum :grader, [:f1_logloss, :discrete_mean_squared_error, :diff_ratio, :manual, :external], map: :string
  as_enum :primary_sort_order, [:ascending, :descending], map: :string
  as_enum :secondary_sort_order, [:ascending, :descending, :not_used], map: :string

  validates_presence_of :status
  validates_presence_of :challenge
  validates_presence_of :organizer_id
  validates_presence_of :primary_sort_order
  validates_presence_of :grading_factor
  validates_uniqueness_of :challenge_client_name
  validates :challenge_client_name, format: { with: /\A[a-zA-Z0-9]/ }
  validates_presence_of :challenge_client_name


  default_scope { order("featured_sequence DESC,
                         CASE status_cd
                          WHEN 'running' THEN 1
                          WHEN 'starting_soon' THEN 2
                          WHEN 'completed' THEN 3
                          WHEN 'cancelled' THEN 4
                          WHEN 'draft' THEN 5
                          ELSE 6
                        END, created_at DESC") }

  after_initialize do
    if self.new_record?
      self.submission_license = "Please upload your submissions and include a detailed description of the methodology, techniques and insights leveraged with this submission. After the end of the challenge, these comments will be made public, and the submitted code and models will be freely available to other crowdAI participants. All submitted content will be licensed under Creative Commons (CC)."
      #self.daily_submissions = 5
    end
  end

  def record_page_view
    self.page_views ||= 0
    self.page_views += 1
    self.save
  end

  def status_formatted
    return 'Starting soon' if status == :starting_soon
    return status.capitalize
  end

  def submissions_remaining(participant_id)
    submissions_today = self.submissions.where("participant_id = ? and created_at >= ?", participant_id, Time.now - 24.hours).order(created_at: :asc)
    if submissions_today.blank?
      reset_time = DateTime.now + 1.day
      return [(self.daily_submissions - 1),reset_time]
    else
      reset_time = submissions_today.first.created_at + 1.day
      return [(self.daily_submissions - submissions_today.count),reset_time]
    end
  end

  def cache_rendered_markdown
    if evaluation_markdown_changed?
      self.evaluation = Kramdown::Document.new(self.evaluation_markdown,{coderay_line_numbers: nil}).to_html
    end
    if description_markdown_changed?
      self.description = Kramdown::Document.new(self.description_markdown,{coderay_line_numbers: nil}).to_html
    end
    if rules_markdown_changed?
      self.rules = Kramdown::Document.new(self.rules_markdown,{coderay_line_numbers: nil}).to_html
    end
    if prizes_markdown_changed?
      self.prizes = Kramdown::Document.new(self.prizes_markdown,{coderay_line_numbers: nil}).to_html
    end
    if resources_markdown_changed?
      self.resources = Kramdown::Document.new(self.resources_markdown,{coderay_line_numbers: nil}).to_html
    end
    if dataset_description_markdown_changed?
      self.dataset_description = Kramdown::Document.new(self.dataset_description_markdown,{coderay_line_numbers: nil}).to_html
    end
    if submission_instructions_markdown_changed?
      self.submission_instructions = Kramdown::Document.new(self.submission_instructions_markdown,{coderay_line_numbers: nil}).to_html
    end
    if license_markdown_changed?
      self.license = Kramdown::Document.new(self.license_markdown,{coderay_line_numbers: nil}).to_html
    end
    if winner_description_markdown_changed?
      self.winner_description = Kramdown::Document.new(self.winner_description_markdown,{coderay_line_numbers: nil}).to_html
    end
  end

  def should_generate_new_friendly_id?
    challenge_changed?
  end

  def valid_status
    if self.status == :running
      if self.dataset_files.none?
        errors.add(:base, "Challenge cannot start until dataset files are added.")
      end
    end
  end

  def reset_featured_seq
    if status_changed? && (self.status == :completed || self.status == :terminated)
      self.featured_sequence = 0
    end
  end

end
