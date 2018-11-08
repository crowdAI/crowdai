class DatasetTermsController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_challenge

  def update
    @challenge_participant = ChallengeParticipant.find(params[:id])
    @challenge_participant.update(accepted_dataset_toc: true)
    redirect_to challenge_dataset_files_path(@challenge)
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end
end
