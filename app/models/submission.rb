class Submission < ActiveRecord::Base
  belongs_to :competition
  belongs_to :user
  belongs_to :team
  has_many :submission_files, dependent: :destroy
  accepts_nested_attributes_for :submission_files, reject_if: :all_blank, allow_destroy: true

  as_enum :submission_type, [:user, :team], map: :string
  validates_presence_of :submission_type
end
