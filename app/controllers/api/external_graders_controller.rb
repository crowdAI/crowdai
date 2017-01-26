class Api::ExternalGradersController < Api::BaseController

  def show
    message = nil
    status = nil
    participant = Participant.where(api_key: params[:id]).first
    if participant.present?
      message = "API key is valid"
      status = :ok
    else
      message = "No participant could be found for this API key"
      status = :not_found
    end
    render json: {message: message}, status: status
  end


  def update
    message = nil
    status = nil
    participant = Participant.where(api_key: params[:id]).first
    begin
      validate_params
      submission = Submission.create!(participant_id: participant.id,
                                      challenge_id: params[:challenge_id],
                                      description_markdown: 'Submitted externally.')
      SubmissionGrade.create!(grading_params(submission))
      message = "participant: #{participant.name}, submission: #{params[:id]} scored"
      status = :accepted
    rescue => e
      status = :bad_request
      message = e
    ensure
      render json: {message: message}, status: status
    end
  end


  private
  def grading_params(submission)
    case params[:grading_status]
      when 'graded'
        {submission_id: submission.id,
         score: params[:score],
         score_secondary: params[:score_secondary],
         grading_status_cd: 'graded',
         grading_message: nil}
      when 'failed'
        {submission_id: submission.id,
         score: nil,
         score_secondary: nil,
         grading_status_cd: 'failed',
         grading_message: params[:grading_message]}
    end
  end

  def validate_params
    raise 'challenge_id is a required field' if !params[:challenge_id].present?
    if !['graded','failed'].include?(params[:grading_status])
      raise "grading_status must be [graded|failed]"
    end
    raise 'score is a required field' if !params[:score].present?
  end



end
