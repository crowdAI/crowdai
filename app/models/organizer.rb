class Organizer < ActiveRecord::Base
  has_many :challenges, dependent: :destroy
  has_many :users, dependent: :nullify

  validates :organizer, presence: true
end
