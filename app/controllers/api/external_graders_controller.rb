class Api::ExternalGradersController < Api::BaseController

  class DeveloperAPIKeyInvalid < StandardError
    def initialize(msg="The API key did not match any participant record.")
      super
    end
  end

  class ChallengeClientNameInvalid < StandardError
    def initialize(msg="The Challenge Client Name string did not match any challenge.")
      super
    end
  end

  class GradingStatusInvalid < StandardError
    def initialize(msg="Grading status must be one of (graded|failed)")
      super
    end
  end

  class SubmissionIdInvalid < StandardError
    def initialize(msg="Submission ID is invalid.")
      super
    end
  end

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
      raise Api::ExternalGradersController::DeveloperAPIKeyInvalid if participant.nil?
      challenge = Challenge.where(challenge_client_name: params[:challenge_client_name]).first
      raise Api::ExternalGradersController::ChallengeClientNameInvalid if challenge.nil?
      submission = Submission.create!(participant_id: participant.id,
                                      challenge_id: challenge.id,
                                      description_markdown: params[:comment],
                                      media_large: params[:media_large],
                                      media_thumbnail: params[:media_thumbnail],
                                      media_content_type: params[:media_content_type])
      submission.submission_grades.create!(grading_params)
      message = "Participant #{participant} scored"
      status = :accepted
    rescue => e
      #Rails.logger.error e
      #Rails.logger.error params
      status = :bad_request
      message = e
    ensure
      render json: { message: message, submission_id: submission.inspect }, status: status
    end
  end


    def validate_s3_key(s3_key)
      S3Service.new(s3_key,shared_bucket=true).valid_key?
    end


    private
    def grading_params
      case params[:grading_status]
      when 'graded'
        { score: params[:score],
          score_secondary: params[:score_secondary],
          grading_status_cd: 'graded',
          grading_message: nil }
      when 'failed'
        { score: nil,
          score_secondary: nil,
          grading_status_cd: 'failed',
          grading_message: params[:grading_message] }
      else
        raise Api::ExternalGradersController::ChallengeClientNameInvalid
      end
    end

end
