# == Schema Information
#
# Table name: challenges
#
#  id                               :integer          not null, primary key
#  organizer_id                     :integer
#  challenge                        :string
#  status_cd                        :string           default("draft")
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  tagline                          :string
#  primary_sort_order_cd            :string           default("ascending")
#  secondary_sort_order_cd          :string
#  perpetual_challenge              :boolean          default(FALSE)
#  grading_factor                   :float            default(1.0)
#  grader_cd                        :string
#  answer_file_s3_key               :string
#  page_views                       :integer          default(0)
#  participant_count                :integer          default(0)
#  submission_count                 :integer          default(0)
#  score_title                      :string
#  score_secondary_title            :string
#  automatic_grading                :boolean          default(FALSE)
#  slug                             :string
#  submission_license               :string
#  api_required                     :boolean          default(FALSE)
#  daily_submissions                :integer
#  threshold                        :float
#  start_dttm                       :datetime
#  end_dttm                         :datetime
#  media_on_leaderboard             :boolean          default(FALSE)
#  challenge_client_name            :string
#  online_grading                   :boolean          default(TRUE)
#  api_key                          :string
#  vote_count                       :integer          default(0)
#  start_date                       :date
#  end_date                         :date
#  start_time                       :time
#  end_time                         :time
#  description_markdown             :text
#  description                      :text
#  evaluation_markdown              :text
#  evaluation                       :text
#  rules_markdown                   :text
#  rules                            :text
#  prizes_markdown                  :text
#  prizes                           :text
#  resources_markdown               :text
#  resources                        :text
#  submission_instructions_markdown :text
#  submission_instructions          :text
#  license_markdown                 :text
#  license                          :text
#  dataset_description_markdown     :text
#  dataset_description              :text
#  image_file                       :string
#
# Indexes
#
#  index_challenges_on_organizer_id  (organizer_id)
#  index_challenges_on_slug          (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_0bdc80d25a  (organizer_id => organizers.id)
#

class Challenge < ApplicationRecord
  #searchkick
  include FriendlyId
  include ApiKey

  friendly_id :challenge, use: [:slugged, :finders]
  before_validation :cache_rendered_markdown
  validate :valid_status
  has_paper_trail :ignore => [:created_at, :updated_at, :page_views, :description, :rules, :prizes, :resources, :evaluation, :license]
  after_create :set_api_key

  belongs_to :organizer

  has_many :dataset_files, dependent: :destroy
  mount_uploader :image_file, ImageUploader
  #validates :image_file, file_size: { less_than: 5.megabytes }

  has_many :submission_file_definitions,  dependent: :destroy, inverse_of: :challenge
  accepts_nested_attributes_for           :submission_file_definitions,
                                          reject_if: :all_blank,
                                          allow_destroy: true

  has_many :submissions,                  dependent: :destroy
  has_many :leaderboards,                 class_name: 'Leaderboard'
  has_many :ongoing_leaderboards,         class_name: 'OngoingLeaderboard'
  has_many :participant_challenges,       class_name: 'ParticipantChallenge'
  has_many :topics
  has_many :emails,                       dependent: :destroy
  has_many :votes, as: :votable


  as_enum :status, [:draft, :running, :completed, :perpetual, :starting_soon], map: :string
  as_enum :grader, [:f1_logloss, :discrete_mean_squared_error, :diff_ratio, :manual, :external], map: :string
  as_enum :primary_sort_order, [:ascending, :descending], map: :string
  as_enum :secondary_sort_order, [:ascending, :descending, :not_used], map: :string

  validates_presence_of :status
  validates_presence_of :challenge
  validates_presence_of :organizer_id
  #validates_presence_of :grader
  validates_presence_of :primary_sort_order
  validates_presence_of :grading_factor
  #validates_uniqueness_of :challenge_client_name
  validates :challenge_client_name, format: { with: /\A[a-zA-Z0-9]/ }
  validates_presence_of :challenge_client_name


  default_scope { order("CASE status_cd
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
      self.daily_submissions = 5
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
    submissions_today = self.submissions.where("participant_id = ? and created_at >= ?", participant_id, Time.now - 24.hours).count
    return (self.daily_submissions - submissions_today)
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
    if license_markdown_changed?
      self.license = RenderMarkdown.new.render(license_markdown)
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
    if self.status == :cancelled && self.status_was != :running
      errors.add(:base, "Only a running challenge may be cancelled.")
    end
  end

end
