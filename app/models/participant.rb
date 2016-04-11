class Participant < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save :process_urls

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable #:confirmable,

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

  has_many :participant_challenges
  has_many :challenges, through: :participant_challenges
  has_many :submissions
  has_many :team_participants
  has_many :teams, through: :team_participants
  has_many :posts
  belongs_to :organizer
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  def admin?
    admin
  end

  def avatar
    image.try(:image)
  end

  def avatar_medium_url
    if image.present?
      image.image.url(:medium)
    else
      "//#{ENV['HOST']}/assets/not_found_iamge.png"
    end
  end

  def process_urls
    ['website','github','linkedin','twitter'].each do |url_field|
      format_url(url_field)
    end
  end

  def format_url(url_field)
    if self.send(url_field).present?
      unless self.send(url_field).include?("http://") || self.website.include?("https://")
        self.send("#{url_field}=", "http://#{self.send(url_field)}")
      end
    end
  end

end
