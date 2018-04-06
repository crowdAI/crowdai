class Api::SubmissionsController < Api::BaseController
  before_action :auth_by_api_key
  before_action :set_organizer
  respond_to :json

  def index
    permitted_challenge_ids = @organizer.challenges.pluck(:id)
    @submissions = Submission
      .where(challenge_id: params[:challenge_id])
    render json: @submissions,
      each_serializer: Api::SubmissionSerializer,
      status: :ok
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
