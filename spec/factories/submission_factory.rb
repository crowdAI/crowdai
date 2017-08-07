# == Schema Information
#
# Table name: submissions
#
#  id                   :integer          not null, primary key
#  challenge_id         :integer
#  participant_id       :integer
#  score                :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  description          :text
#  score_secondary      :float
#  grading_message      :string
#  grading_status_cd    :string           default("ready")
#  description_markdown :text
#  vote_count           :integer          default(0)
#  post_challenge       :boolean          default(FALSE)
#  api                  :string
#  media_large          :string
#  media_thumbnail      :string
#  media_content_type   :string
#
# Indexes
#
#  index_submissions_on_challenge_id    (challenge_id)
#  index_submissions_on_participant_id  (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#  fk_rails_...  (participant_id => participants.id)
#

FactoryGirl.define do
  factory :submission, class: Submission do
    challenge { FactoryGirl.create :challenge }
    association :participant
    grading_status :ready
    description_markdown '#Upload description'
    submission_files { [ build(:submission_file, submission_file_s3_key: 'project.tar') ]}
  end
end
