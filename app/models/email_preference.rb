# == Schema Information
#
# Table name: email_preferences
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  newsletter            :boolean          default(TRUE)
#  any_leaderboard       :boolean          default(TRUE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  challenges_followed   :boolean          default(TRUE)
#  mentions              :boolean          default(TRUE)
#  receive_every_email   :boolean          default(FALSE)
#  receive_daily_digest  :boolean          default(TRUE)
#  receive_weekly_digest :boolean          default(FALSE)
#
# Indexes
#
#  index_email_preferences_on_participant_id  (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (participant_id => participants.id)
#

class EmailPreference < ApplicationRecord
  belongs_to :participant
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.newsletter = true
    self.challenges_followed = true
    self.mentions = true
    self.receive_every_email = false
    self.receive_daily_digest = true
    self.receive_weekly_digest = false
  end

end
