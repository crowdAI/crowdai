class Api::ParticipantsController < Api::BaseController
  before_action :auth_by_admin_api_key
  respond_to :json

  def show
    @participant = Participant.where(name: params[:id]).first
    render json: @participant, status: :ok
  end

end
