class Organizer < ActiveRecord::Base
  has_many :challenges, dependent: :destroy
  has_many :participants, dependent: :nullify

  validates :organizer, presence: true
end
