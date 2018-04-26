class Api::SubmissionsController < Api::BaseController
  before_action :auth_by_api_key, only: :index
  before_action :auth_by_admin_api_key, only: :show
  before_action :set_organizer, only: :index
  respond_to :json

  def show
    @submission = Submission.where(id: params[:id]).first
    if @submission.present?
      payload = Api::SubmissionSerializer.new(@submission).as_json
      payload.merge({message: "Submission found."})
      status = :ok
    else
      payload = { message: "No submission could be found for this id"}
      status = :not_found
    end
    render json: payload, status: status
  end


  def index
    begin
      challenge_id = params[:challenge_id]
      #allow only own organiser to access this challenge's submissions
      permitted_challenge_ids = @organizer.challenges.pluck(:id).map(&:to_s)
      if !permitted_challenge_ids.include?(challenge_id)
        raise OrganizerNotAuthorized
      end
      set_submissions(challenge_id, params[:grading_status], params[:after], params[:challenge_round_id])
      render json: @submissions, each_serializer: Api::SubmissionSerializer, status: :ok
      rescue ActiveRecord::RecordNotFound
        message = "challenge_id #{challenge_id} not found"
        render json: {message: message}, status: :not_found
      rescue OrganizerNotAuthorized => o
        render json: {message: o}, status: :unauthorized
      rescue => e
        message = e
        render json: {message: "server error"}, status: :internal_server_error
    end
  end


  private
  def set_submissions(challenge_id, grading_status, after, challenge_round_id)
    if grading_status.blank? && after.blank? && challenge_round_id.blank?
      @submissions = Submission.where(challenge_id: challenge_id)
    elsif grading_status.blank? && after.blank? && challenge_round_id.present?
      @submissions = Submission.where("challenge_id = ? AND challenge_round_id = ?",
        challenge_id, challenge_round_id)
    elsif grading_status.blank? && after.present? && challenge_round_id.present?
      @submissions = Submission.where("challenge_id = ? AND created_at >= ? AND challenge_round_id = ?",
        challenge_id, after, challenge_round_id)
    elsif grading_status.blank? && after.present? && challenge_round_id.blank?
      @submissions = Submission.where("challenge_id = ? AND created_at >= ?",
        challenge_id, after)
    elsif grading_status.present? && after.present? && challenge_round_id.present?
      @submissions = Submission.where("challenge_id = ? AND grading_status_cd = ? AND created_at >= ? AND challenge_round_id = ?",
        challenge_id, grading_status, after, challenge_round_id)
    elsif grading_status.present? && after.present? && challenge_round_id.blank?
      @submissions = Submission.where("challenge_id = ? AND grading_status_cd = ? AND created_at >= ?",
        challenge_id, grading_status, after)
    elsif grading_status.present? && after.blank? && challenge_round_id.blank?
      @submissions = Submission.where("challenge_id = ? AND grading_status_cd = ?",
        challenge_id, grading_status)
    elsif grading_status.present? && after.blank? && challenge_round_id.present?
      @submissions = Submission.where("challenge_id = ? AND grading_status_cd = ? AND challenge_round_id = ?",
        challenge_id, grading_status, challenge_round_id)
    end
  end


  private
  def set_organizer
    token, _options = ActionController::HttpAuthentication::Token.token_and_options(request)
    @organizer = Organizer.find_by_api_key(token)
  end

  class OrganizerNotAuthorized < StandardError
    def initialize(msg='The organizer is not authorized to access the requested challenge_id')
      super
    end
  end

end
