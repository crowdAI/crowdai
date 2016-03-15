class HostingInstitution < ActiveRecord::Base
  has_many :competitions, dependent: :destroy
  has_many :users, dependent: :nullify

  validates :institution, presence: true
end
