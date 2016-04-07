class HostingInstitution < ActiveRecord::Base
  has_many :challenges, dependent: :destroy
  has_many :users, dependent: :nullify

  validates :institution, presence: true
end
