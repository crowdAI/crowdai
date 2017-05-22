class Participant < ApplicationRecord
  searchkick
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  include FriendlyId
  include ApiKey
  friendly_id :name, use: [:slugged, :finders]
  after_create :set_email_preferences
  after_create :set_api_key
  before_save { self.email = email.downcase }
  before_save :process_urls
  validates :api_key, presence: true
  mount_uploader :image_file, ImageUploader


  devise :database_authenticatable,  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  belongs_to :organizer
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_many :submissions
  has_many :posts
  has_many :votes,                      dependent: :destroy
  has_many :comments,                   dependent: :nullify
  has_many :articles,                   dependent: :nullify
  has_many :leaderboards,               class_name: 'Leaderboard'
  has_many :ongoing_leaderboards,       class_name: 'OngoingLeaderboard'
  has_many :participant_challenges,     class_name: 'ParticipantChallenge'
  has_many :dataset_file_downloads,     dependent: :destroy
  has_many :email_preferences,          dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/


  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :website, :url => { allow_blank: true }
  validates :github, :url => { allow_blank: true }
  validates :linkedin, :url => { allow_blank: true }
  validates :twitter, :url => { allow_blank: true }
  validates :name, presence: true
  validates :name, length: { minimum: 2 }, allow_blank: false, uniqueness: { case_sensitive: false }


  def disable_account(reason)
    self.update(account_disabled: true,
                account_disabled_reason: reason,
                account_disabled_dttm: Time.now )
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


end
