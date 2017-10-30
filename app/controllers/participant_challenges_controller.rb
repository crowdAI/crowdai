class ParticipantChallengesController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_challenge, only: [:index]
  respond_to :html, :js

  def index
    @participant_challenges = @challenge.participant_challenges.page(params[:page]).per(20)
    authorize @participant_challenges
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

end
