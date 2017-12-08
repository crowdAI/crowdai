class ChallengeCallResponsesController < ApplicationController
  before_action :set_challenge_call

  def new
    @challenge_call_reponse = @challenge_call.challenge_call_responses.new
  end

  def create
    @challenge_call_reponse = @challenge_call
                                .challenge_call_responses
                                .new(challenge_call_response_params)
    if @challenge_call_reponse.save
      redirect_to challenge_call_challenge_call_response_path(@organizer,@challenge), notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  def show
    @challenge_call_response = ChallengeCallResponse.find(:id)
  end

  private


  def challenge_call_response_params
    params.require(:challenge_call_response)
          .permit(:first_name,
                  :family_name,
                  :email,
                  :phone,
                  :organization,
                  :description)
  end

  def set_challenge_call
    @challenge_call = ChallengeCall.friendly.find(params[:challenge_call_id])
  end
end
