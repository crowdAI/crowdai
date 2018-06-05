class ParticipantChallengesController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_challenge, only: [:index,:approve,:deny]
  respond_to :html, :js

  def index
    @participant_challenges = @challenge
      .participant_challenges
      .order(name: :asc)
      .page(params[:page])
      .per(20)
    authorize @participant_challenges
  end

  def approve
    challenge_registration = @challenge.challenge_registrations
      .where(participant_id: current_participant.id)
      .first
    challenge_registration.update(status: :registered)
    redirect_to challenge_participant_challenges_path(@challenge)
  end

  def deny
    challenge_registration = @challenge.challenge_registrations
      .where(participant_id: current_participant.id)
      .first
    challenge_registration.update(status: :rejected)
    redirect_to challenge_participant_challenges_path(@challenge)
  end

  private
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

end
