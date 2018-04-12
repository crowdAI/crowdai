class ChallengeCallResponsesController < ApplicationController
  before_action :set_challenge_call

  def new
    @challenge_call_response = @challenge_call
      .challenge_call_responses.new
  end

  def create
    @challenge_call_response = @challenge_call
      .challenge_call_responses
      .new(challenge_call_response_params)
    if @challenge_call_response.save
      Admin::ChallengeCallResponseNotificationJob
          .perform_later(@challenge_call_response)
      redirect_to challenge_call_show_path(
          @challenge_call,@challenge_call_response)
    else
      render :new
    end
  end

  def show
    @challenge_call_response = ChallengeCallResponse.find(params[:id])
  end

  private
  def challenge_call_response_params
    params
      .require(:challenge_call_response)
      .permit(
        :contact_name,
        :email,
        :phone,
        :organization,
        :challenge_title,
        :challenge_description,
        :motivation,
        :organizers_bio,
        :timeline,
        :other,
        :evaluation_criteria)
  end

  def set_challenge_call
    @challenge_call = ChallengeCall.friendly.find(params[:challenge_call_id])
  end
end
