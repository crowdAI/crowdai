class ChallengeRegistration < ApplicationRecord
  belongs_to :challenge
  belongs_to :participant
  mount_uploader :eua_file, EuaUploader

  as_enum :status, [:requested, :submitted, :registered, :rejected], map: :string
end
