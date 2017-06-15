class LeaderboardsController < ApplicationController
  before_filter :authenticate_participant!, except: [:index, :video_modal]
  before_action :set_leaderboard, only: [:show]
  before_action :set_challenge
  respond_to :js, :html

  def index
    @leaderboard = @challenge.leaderboards
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
    Rails.logger.debug("params: #{params.inspect}");
    @leaderboard = Leaderboard.where(submission_id: params[:submission_id]).first
    render 'leaderboards/ajax/video_modal' if @leaderboard
  end

  def submission_detail
    @leaderboard = @challenge.leaderboards
    @submissions = Submission.where(participant_id: params[:participant_id],challenge_id: params[:challenge_id]).order(created_at: :desc)
    render js: concept(Leaderboard::Cell,@leaderboard, challenge: @challenge, submissions: @submissions).(:insert_submissions)
  end

  private
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end

end
