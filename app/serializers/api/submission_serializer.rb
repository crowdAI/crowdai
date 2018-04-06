class Api::SubmissionSerializer < ActiveModel::Serializer
  has_many :submission_files,
    serializer: Api::SubmissionFileSerializer

  attributes :id,
    :challenge_id,
    :challenge_name,
    :participant_id,
    :score,
    :score_secondary,
    :clef_method_description,
    :clef_retrieval_type,
    :clef_run_type,
    :clef_primary_run,
    :clef_other_info,
    :clef_additional


  def challenge_name
    object.challenge.challenge
  end
end
