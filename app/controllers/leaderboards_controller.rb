class LeaderboardsController < ApplicationController
  before_filter :authenticate_participant!, except: [:index, :video_modal]
  before_action :set_leaderboard, only: [:show]
  before_action :set_challenge
  respond_to :js, :html

  def index
    @leaderboards = @challenge.leaderboards
    if @challenge.completed?
      @ongoing_leaderboards = @challenge.ongoing_leaderboards
    end
    if current_participant && (current_participant.admin? || @challenge.organizer_id == current_participant.organizer_id)
      @participant_submissions = ParticipantSubmission.where(challenge_id: @challenge.id)
    end
  end

  def show
  end

  def video_modal
    @submission_id = params[:submission_id]
    @participant = params[:participant]
    @score = params[:score]
    render 'video_modal'
  end

  private
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  def set_challenge
    challenge = Challenge.friendly.find(params[:challenge_id])
    @challenge = ChallengesPresenter.new(challenge)
  end

end
