class SubmissionFile < ActiveRecord::Base
  belongs_to :submission
end

# == Schema Information
#
# Table name: submission_files
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  seq           :integer
#  filename      :string
#  filetype      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
