class TeamUser < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end

# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  from_date  :date
#  thru_date  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
