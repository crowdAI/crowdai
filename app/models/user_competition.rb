class UserCompetition < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition
end

# == Schema Information
#
# Table name: user_competitions
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  competition_id :integer
#  rules_accepted :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
