class Submission < ActiveRecord::Base
  belongs_to :competition
  belongs_to :user
  belongs_to :team
  has_many :submission_files, dependent: :destroy
  accepts_nested_attributes_for :submission_files, reject_if: :all_blank, allow_destroy: true
end

# == Schema Information
#
# Table name: submissions
#
#  id                 :integer          not null, primary key
#  competition_id     :integer
#  user_id            :integer
#  team_id            :integer
#  evaluated          :boolean
#  score              :float
#  ranking            :float
#  submission_type_cd :string
#  withdrawn          :boolean
#  withdrawn_date     :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
