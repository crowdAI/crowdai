class Api::OpensimGradingsController < Api::BaseController


  def show
    message = nil
    status = nil
    participant = Participant.where(api_key: params[:id]).first
    if participant.present?
      message = "Developer API key is valid"
      status = :ok
    else
      message = "No participant could be found for this API key"
      status = :not_found
    end
    render json: { message: message }, status: status
  end


  def create
    message = nil
    status = nil
    begin
      participant = Participant.where(api_key: params[:dev_api_key]).first
      raise ActiveRecord::RecordNotFound if participant.nil?
      submission = Submission.create!(participant_id: participant.id,
                                      challenge_id: params[:challenge_id],
                                      description_markdown: 'Submitted externally.')
      SubmissionGrade.create!(grading_params(submission))
      message = "Participant: #{participant.name}, submission: #{params[:id]} scored"
      status = :accepted
    rescue => e
      status = :bad_request
      message = e
    ensure
      render json: { message: message, submission_id: submission.id }, status: status
    end
  end


  def update
    begin
      submission = Submission.find(params[:submission_id])
      validate_s3_key(params[:s3_key])
      ProcessAiGymGifJob.perform_later(submission.id,params[:s3_key])
    rescue => e
      status = :bad_request
      message = e
    ensure
      render json: {message: message}, status: status
    end
  end


  def validate_s3_key(s3_key)
    if S3Service.new(s3_key,shared_bucket=true).invalid_key?
      raise InvalidS3Key, "The provided S3 key could not be accessed in the crowdAI shared bucket."
    end
  end


  private
  def grading_params(submission)
    case params[:grading_status]
      when 'graded'
        { submission_id: submission.id,
          score: params[:score],
          score_secondary: params[:score_secondary],
          grading_status_cd: 'graded',
          grading_message: nil}
      when 'failed'
        { submission_id: submission.id,
          score: nil,
          score_secondary: nil,
          grading_status_cd: 'failed',
          grading_message: params[:grading_message]}
      end
    end


end
