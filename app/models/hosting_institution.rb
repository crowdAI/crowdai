class HostingInstitution < ActiveRecord::Base
  has_many :competitions, dependent: :destroy

  validates :institution, presence: true
  validates :contact_person, presence: true
  validates :contact_phone, presence: true
  validates :contact_email, presence: true
end


# == Schema Information
#
# Table name: hosting_institutions
#
#  id             :integer          not null, primary key
#  institution    :string
#  address        :text
#  description    :text
#  contact_person :string
#  contact_phone  :string
#  contact_email  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
