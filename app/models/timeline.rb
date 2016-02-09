class Timeline < ActiveRecord::Base
  belongs_to :competition

  validates :event, presence: true
  validates :event_time, presence: true
end

# == Schema Information
#
# Table name: timelines
#
#  id             :integer          not null, primary key
#  competition_id :integer
#  seq            :integer
#  event          :string
#  event_time     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
