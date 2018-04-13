class Api::SubmissionSerializer < ActiveModel::Serializer
  has_many :submission_files,
    serializer: Api::SubmissionFileSerializer

  attributes :id,
    :challenge_id,
    :challenge_name,
    :participant_id,
    :participant_email,
    :participant_name,
    :participant_firstname,
    :participant_lastname,
    :participant_affiliation,
    :grading_status_cd,
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

  def participant_email
    @participant ||= object.participant
    return @participant.email
  end

  def participant_name
    @participant ||= object.participant
    return @participant.name
  end

  def participant_firstname
    @participant ||= object.participant
    return @participant.first_name
  end

  def participant_lastname
    @participant ||= object.participant
    return @participant.last_name
  end

  def participant_affiliation
    @participant ||= object.participant
    return @participant.affiliation
  end

end
