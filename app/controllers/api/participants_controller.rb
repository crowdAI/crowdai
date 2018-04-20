class Api::ParticipantsController < Api::BaseController
  before_action :auth_by_admin_api_key
  respond_to :json

  def show
    @participant = Participant
      .where("lower(name) = '#{params[:id].downcase}'").first
    if @participant.present?
      payload = Api::ParticipantSerializer.new(@participant).as_json
      payload.merge({ message: 'Participant found.'})
      status = :ok
    else
      payload = { message: "No participant could be found for this username" }
      status = :not_found
    end
    render json: payload, status: status
  end

end
