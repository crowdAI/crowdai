class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :authentication_keys => [:login]

  attr_accessor :login

  has_many :user_competitions
  has_many :competitions, :through => :user_competitions
  has_many :submissions
  has_many :user_teams
  has_many :teams, through: :user_teams


  def admin?
    self.admin
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
