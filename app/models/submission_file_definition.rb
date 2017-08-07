# == Schema Information
#
# Table name: submission_file_definitions
#
#  id                          :integer          not null, primary key
#  challenge_id                :integer
#  seq                         :integer
#  submission_file_description :string
#  filetype_cd                 :string
#  file_required               :boolean          default(FALSE)
#  submission_file_help_text   :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_submission_file_definitions_on_challenge_id  (challenge_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#

class SubmissionFileDefinition < ApplicationRecord
  belongs_to :challenge

  as_enum :filetype, [:csv, :zip, :tar, :txt, :any], map: :string

  def file_accept
    case self.filetype_cd
      when 'csv'
        'text/csv'
      when 'zip'
        'application/zip'
      when 'tar'
        'application/tar'
      when 'txt'
        'text/plain'
      when 'any'
        nil
    end
  end

end
