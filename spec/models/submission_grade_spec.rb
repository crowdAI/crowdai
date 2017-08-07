# == Schema Information
#
# Table name: submission_grades
#
#  id                :integer          not null, primary key
#  submission_id     :integer
#  grading_status_cd :string
#  grading_message   :string
#  grading_factor    :float
#  score             :float
#  score_secondary   :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#
# Indexes
#
#  index_submission_grades_on_slug           (slug) UNIQUE
#  index_submission_grades_on_submission_id  (submission_id)
#
# Foreign Keys
#
#  fk_rails_...  (submission_id => submissions.id)
#

require 'spec_helper'

describe SubmissionGrade do
  context 'fields' do
    it { is_expected.to respond_to :grading_status_cd }
    it { is_expected.to respond_to :grading_factor }
    it { is_expected.to respond_to :score }
    it { is_expected.to respond_to :score_secondary }
  end

  context 'associations' do
    it { is_expected.to belong_to(:submission) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:submission_id) }
  end

end
