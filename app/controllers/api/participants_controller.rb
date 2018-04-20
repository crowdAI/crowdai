class Api::ParticipantsController < Api::BaseController
  before_action :auth_by_admin_api_key
  respond_to :json

  def show
    @participant = Participant
      .where("lower(name) = '#{params[:id].downcase}'").first
    if @participant.present?
      message = Api::ParticipantSerializer.new(@participant).as_json
      status = :ok
    else
      message = "No participant could be found for this username"
      status = :not_found
    end
    byebug
    render json: { message: message }, status: status
  end

end
