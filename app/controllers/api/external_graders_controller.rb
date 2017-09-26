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

  class NoSubmissionSlotsRemaining < StandardError
    def initialize(msg="The participant has no submission slots remaining for today.")
      super
    end
  end

  def show
    participant = Participant.where(api_key: params[:id]).first
    if participant.present?
      message = "Developer API key is valid"
      status = :ok
    else
      message = "No participant could be found for this API key"
      status = :not_found
    end
    render json: { message: message, participant_id: participant.id }, status: status
  end


  def create
    message = nil
    status = nil
    submission_id = nil
    begin
      participant = Participant.where(api_key: params[:api_key]).first
      raise Api::ExternalGradersController::DeveloperAPIKeyInvalid if participant.nil?
      challenge = Challenge.where(challenge_client_name: params[:challenge_client_name]).first
      raise Api::ExternalGradersController::ChallengeClientNameInvalid if challenge.nil?
      submissions_remaining = challenge.submissions_remaining(participant.id)
      raise Api::ExternalGradersController::NoSubmissionSlotsRemaining if submissions_remaining < 1
      submission = Submission.create!(participant_id: participant.id,
                                      challenge_id: challenge.id,
                                      description_markdown: params[:comment],
                                      media_large: params[:media_large],
                                      media_thumbnail: params[:media_thumbnail],
                                      media_content_type: params[:media_content_type])
      submission.submission_grades.create!(grading_params)
      submission_id = submission.id
      notify_admins(submission)
      message = "Participant #{participant.name} scored"
      status = :accepted
    rescue => e
      status = :bad_request
      message = e
    ensure
      render json: { message: message, submission_id: submission_id }, status: status
    end
  end

  def update
    message = nil
    status = nil
    submission_id = params[:id]
    begin
      Rails.logger.info("PATCHing submission #{params.inspect}")
      submission = Submission.find(submission_id)
      submission.update({media_large: params[:media_large],
                         media_thumbnail: params[:media_thumbnail],
                         media_content_type: params[:media_content_type]})
      submission.save
      notify_admins(submission)
      message = "Submission #{submission.id} for participant #{submission.participant_id} updated"
      status = :accepted
    rescue => e
      status = :bad_request
      message = e
    ensure
      render json: { message: message, submission_id: submission_id }, status: status
    end
  end


  def challenge_config
    begin
      challenge = Challenge.where(challenge_client_name: params[:challenge_client_name]).first
      if challenge.nil?
        raise Api::ExternalGradersController::ChallengeClientNameInvalid
      end
      message = "Configuration for #{challenge.challenge_client_name}"
      status = :ok
    rescue => e
      config = nil
      status = :bad_request
      message = e
    ensure
      render json: { message: message, config: config }, status: status
    end
  end


  def validate_s3_key(s3_key)
    S3Service.new(s3_key,shared_bucket=true).valid_key?
  end

  def notify_admins(submission)
    Admin::SubmissionNotificationJob.perform_later(submission)
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

# curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET "https://crowdai-stg.herokuapp.com/api/external_graders/4f2b61e1aaf03d3283f135febbe225a4" -H 'Authorization: Token token="427e6d98d38bb0613cc0f7a9bed26c0d"'

# curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST "https://crowdai-stg.herokuapp.com/api/external_graders/?api_key=4f2b61e1aaf03d3283f135febbe225a4&challenge_id=4&comment=test&grading_status=graded&score=0.99" -H 'Authorization: Token token="427e6d98d38bb0613cc0f7a9bed26c0d"'


# local
#curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST "localhost:3000/api/external_graders/?api_key=4f2b61e1aaf03d3283f135febbe225a4&challenge_id=4&comment=test&grading_status=graded&score=0.99" -H 'Authorization: Token token="427e6d98d38bb0613cc0f7a9bed26c0d"'

# patch
#curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X PATCH "localhost:3000/api/external_graders/385?media_large=testlarge&media_thumb=test2&media_content_type=videomp4&challenge_id=4&comment=test&grading_status=graded&score=0.99" -H 'Authorization: Token token="427e6d98d38bb0613cc0f7a9bed26c0d"'
#curl -i -g -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X PATCH "localhost:3000/api/external_graders/385?media_content_type=video/mp4&media_large=challenge_8/4f2b61e1aaf03d3283f135febbe225a4___26a21687bc.mp4&media_thumbnail=challenge_8/4f2b61e1aaf03d3283f135febbe225a4___26a21687bc_134x100.mp4"
