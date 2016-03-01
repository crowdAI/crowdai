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

module SubmissionsHelper
end
