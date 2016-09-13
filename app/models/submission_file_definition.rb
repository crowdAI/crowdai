class SubmissionFileDefinition < ActiveRecord::Base
  has_paper_trail
  belongs_to :challenge

  as_enum :filetype, [:csv, :zip, :tar, :xls, :txt, :any], map: :string
end
