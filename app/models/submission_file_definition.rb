class SubmissionFileDefinition < ApplicationRecord
  has_paper_trail
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
