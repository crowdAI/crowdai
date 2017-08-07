# == Schema Information
#
# Table name: email_preferences
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  opt_out_all           :boolean          default(FALSE)
#  newsletter            :boolean          default(TRUE)
#  my_leaderboard        :boolean          default(TRUE)
#  any_post              :boolean          default(TRUE)
#  my_topic_post         :boolean          default(TRUE)
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

FactoryGirl.define do
  factory :email_preference, class: EmailPreference do
    participant
    newsletter true
    challenges_followed true
    mentions true
    receive_every_email true
    receive_daily_digest false
    receive_weekly_digest false
  end
end
