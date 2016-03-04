class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :authentication_keys => [:login]

  attr_accessor :login

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }

  has_many :user_competitions
  has_many :competitions, :through => :user_competitions
  has_many :submissions
  has_many :team_users
  has_many :teams, through: :team_users
  belongs_to :hosting_institution


  def admin?
    self.admin
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  admin                  :boolean          default(FALSE)
#  phone_number           :string
#  verified               :boolean          default(FALSE)
#  verification_date      :date
#  username               :string
#  country                :string
#  city                   :string
#  timezone               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
