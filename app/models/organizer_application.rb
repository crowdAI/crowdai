# == Schema Information
#
# Table name: organizer_applications
#
#  id                       :integer          not null, primary key
#  contact_name             :string
#  email                    :string
#  phone                    :string
#  organization             :string
#  organization_description :string
#  challenge_description    :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class OrganizerApplication < ApplicationRecord
  #validates :contact_name,              presence: true
  #validates :email,                     presence: true
  #validates :phone,                     presence: true
  #validates :organization,              presence: true
  #validates :organization_description,  presence: true
  #validates :challenge_description,     presence: true
end
