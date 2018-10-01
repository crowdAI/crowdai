class Submission < ApplicationRecord
  include Markdownable
  before_validation :generate_short_url

  belongs_to :challenge
  belongs_to :participant, optional: true
  belongs_to :challenge_round, optional: true
  with_options dependent: :destroy do |assoc|
    assoc.has_many :submission_files
    assoc.has_many :submission_grades
    assoc.has_many :submission_comments
  end
  accepts_nested_attributes_for :submission_files,
    reject_if: lambda { |f| f[:submission_file_s3_key].blank? },
    allow_destroy: true
  has_many :votes, as: :votable

  as_enum :grading_status,
    [:ready, :submitted, :initiated, :graded, :failed], map: :string

  validates :participant_id, presence: true
  validates :challenge_id, presence: true
  validates :grading_status, presence: true
  validate :clef_validations

  delegate :name, to: :participant

  def clef_validations
    return true
    return true unless self.challenge.organizer.clef?
    if clef_method_description.length < 5
      errors.add(:clef_method_description,
        'Must be at least 5 characters.')
    end
  end

  after_create do
    rnd = self.challenge
      .challenge_rounds
      .where(
        'start_dttm <= ? and end_dttm >= ?',
        self.created_at,self.created_at).first
    if rnd.blank?
      rnd = self.challenge.challenge_rounds.last
    end
    if rnd.present?
      self.update(challenge_round_id: rnd.id)
      if self.created_at > rnd.end_dttm
        self.update(post_challenge: true)
      end
    else
      raise ChallengeRoundIDMissing
    end
  end

  after_save do
    if self.grading_status_cd == 'graded'
      CalculateLeaderboardJob
        .perform_later(challenge_round_id: self.challenge_round_id)
    end
    Prometheus::SubmissionCounterService.new(submission_id: self.id).call
  end

  after_destroy do
    CalculateLeaderboardJob
      .perform_later(challenge_round_id: self.challenge_round_id)
  end

  def ready?
    self.grading_status == :ready
  end

  def submitted?
    self.grading_status == :submitted
  end

  def graded?
    self.grading_status == :graded
  end

  def failed?
    self.grading_status == :failed
  end

  def initiated?
    self.grading_status == :initiated
  end

  CLEF_RETRIEVAL_TYPES = {
    'Visual' => :visual,
    'Textual' => :textual,
    'Mixed (Textual and Visual)' => :mixed,
    'Not applicable' => :not_applicable
  }

  CLEF_RUN_TYPES = {
    'Automatic' => :automatic,
    'Feedback or / and Human Assistance' => :feedback,
    'Manual' => :manual
  }

  def as_json(options={})
    super(
      only: [:id, :participant_id, :score, :score_secondary, :grading_status_cd, :grading_message, :post_challenge, :media_content_type, :created_at, :updated_at],
      include: { participant: { only: [:name] }}
    )
  end

  private
  def generate_short_url
    if self.short_url.blank?
      short_url = nil
      begin
        short_url = SecureRandom.hex(6)
      end while (Submission.exists?(short_url: short_url))
      self.short_url = short_url
    end
  end

  class ChallengeRoundIDMissing < StandardError
    def initialize(msg='No Challenge Round ID can be found for this submission')
      super
    end
  end
end
