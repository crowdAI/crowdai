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
      participant = Participant.where(api_key: params[:api_key]).first
      raise ActiveRecord::RecordNotFound if participant.nil?
      submission = Submission.create!(participant_id: participant.id,
                                      challenge_id: params[:challenge_id],
                                      description_markdown: 'Submitted externally.')
      SubmissionGrade.create!(grading_params(submission))
      message = "Participant: #{participant.name}, submission: #{params[:id]} scored"
      status = :accepted
    rescue => e
      Rails.logger.error e
      Rails.logger.error params
      status = :bad_request
      message = e
    ensure
      render json: { message: message, submission_id: submission.id }, status: status
    end
  end


  def update
    begin
      submission = Submission.find(params[:submission_id])
      raise ActiveRecord::RecordNotFound if submission.nil?
      key_valid = validate_s3_key(params[:s3_key])
      raise InvalidS3Key.new(s3_key: params[:s3_key]) if !key_valid
      ProcessAiGymGifJob.perform_later(submission.id,params[:s3_key])
      message = "Animated GIF accepted for processing."
    rescue => e
      Rails.logger.error e
      Rails.logger.error params
      status = :bad_request
      message = e
    ensure
      render json: {message: message}, status: status
    end
  end


  def validate_s3_key(s3_key)
    S3Service.new(s3_key,shared_bucket=true).valid_key?
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
