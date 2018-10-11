class Participant < ApplicationRecord
  has_merit

  include FriendlyId
  include ApiKey
  include Countries
  friendly_id :name, use: [:slugged, :finders, :history]
  before_save :set_api_key
  before_save { self.email = email.downcase }
  before_save :process_urls
  after_create :set_email_preferences
  after_save :refresh_materialized_view
  after_save :publish_to_prometheus
  mount_uploader :image_file, ImageUploader
  validates :image_file, file_size: { less_than: 5.megabytes }

  devise :confirmable,
    :database_authenticatable,
    :lockable,
    :recoverable,
    :registerable,
    :rememberable,
    :validatable

  default_scope { order('name ASC') }
  belongs_to :organizer, optional: true
  has_many :submissions, dependent: :nullify
  has_many :votes, dependent: :destroy
  has_many :topics, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :articles, dependent: :nullify
  has_many :leaderboards,
    class_name: 'Leaderboard'
  has_many :ongoing_leaderboards,
    class_name: 'OngoingLeaderboard'
  has_many :participant_challenges,
    class_name: 'ParticipantChallenge'
  has_many :challenge_registrations,
    class_name: 'ChallengeRegistration'
  has_many :participant_challenge_counts,
    class_name: 'ParticipantChallengeCount'
  has_many :challenge_organizer_participants,
    class_name: 'ChallengeOrganizerParticipant'
  has_many :challenges,
    through: :participant_challenges
  has_many :dataset_file_downloads,
    dependent: :destroy
  has_many :task_dataset_file_downloads,
    dependent: :destroy
  has_many :email_preferences,
    dependent: :destroy
  has_many :email_preferences_tokens,
    dependent: :destroy
  has_many :follows,
    dependent: :destroy
  has_many :participant_clef_tasks,
    dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :access_grants,
    class_name: "Doorkeeper::AccessGrant",
    foreign_key: :resource_owner_id,
    dependent: :destroy
  has_many :access_tokens,
    class_name: "Doorkeeper::AccessToken",
    foreign_key: :resource_owner_id,
    dependent: :destroy

  validates :email,
    presence: true,
    'valid_email_2/email': true,
    uniqueness: { case_sensitive: false }
  validates :website, :url => { allow_blank: true }
  validates :github, :url => { allow_blank: true }
  validates :linkedin, :url => { allow_blank: true }
  validates :twitter, :url => { allow_blank: true }
  validates :name,
    format: {
      with: /[a-zA-Z0-9\-_]/,
      message: 'cannot contain spaces or special characters'
    },
    length: { minimum: 2 },
    uniqueness: { case_sensitive: false }

  #validates :name,
  #  length: { minimum: 2 },
  #  uniqueness: { case_sensitive: false }
  validates :affiliation,
    length: { in: 2...100},
    allow_blank: true
  validates :country_cd,
    inclusion: { in: ISO3166::Country::codes}, allow_blank: true
  validates :address,
    length: { in: 10...255 },
    allow_blank: true
  validates :first_name,
    length: { in: 2...100},
    allow_blank: true
  validates :last_name,
    length:{ in: 2...100},
    allow_blank: true

  def disable_account(reason)
    self.update(
      account_disabled: true,
      account_disabled_reason: reason,
      account_disabled_dttm: Time.now )
  end

  def enable_account
    self.update(
      account_disabled: false,
      account_disabled_reason: nil,
      account_disabled_dttm: nil )
  end

  def active_for_authentication?
    super && self.account_disabled == false
  end

  def inactive_message
    if account_disabled
      "Your account has been disabled. Please contact us at info@crowdai.org."
    end
  end

  def admin?
    admin
  end

  def online?
    updated_at > 10.minutes.ago
  end

  def avatar
    image.try(:image)
  end

  def avatar_medium_url
    if image.present?
      image.image.url(:medium)
    else
      "//#{ENV['HOST']}/assets/image_not_found.png"
    end
  end

  def image_url
    if image_file.file.present?
      image_url = image_file.url
    else
      image_url = 'users/avatar-default.png'
    end
  end

  def process_urls
    ['website','github','linkedin','twitter'].each do |url_field|
      format_url(url_field)
    end
  end

  def format_url(url_field)
    if self.send(url_field).present?
      unless self.send(url_field).include?("http://") || self.send(url_field).include?("https://")
        self.send("#{url_field}=", "http://#{self.send(url_field)}")
      end
    end
  end

  def after_confirmation
    super
    AddToMailChimpListJob.perform_later(self.id)
  end

  def set_email_preferences
    self.email_preferences.create!
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  def self.find_by(args)
    super || NullParticipant.new
  end

  def self.find(args)
    begin
      super
    rescue
      NullParticipant.new
    end
  end

  def refresh_materialized_view
    if saved_change_to_attribute?(:organizer_id)
      RefreshChallengeOrganizerParticipantViewJob.perform_later
    end
  end

  def publish_to_prometheus
    Prometheus::ParticipantCounterService.new.call
  end

end
