class ChallengePartner < ApplicationRecord
  belongs_to :challenge
  mount_uploader :image_file, LogoImageUploader
end
