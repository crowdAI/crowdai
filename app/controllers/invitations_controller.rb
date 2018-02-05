class InvitationsController < ApplicationController

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @organizer = @challenge.organizer

  end

  def destroy
  end

end
