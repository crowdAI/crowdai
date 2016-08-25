class LeaderboardsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_leaderboard, only: [:show]
  before_action :set_challenge

  def index
    @leaderboards = @challenge.leaderboards
    if @challenge.completed?
      @ongoing_leaderboards = @challenge.ongoing_leaderboards
    end
    load_gon({percent_progress: @challenge.timeline.pct_passed})
  end

  def show
    load_gon({percent_progress: @challenge.timeline.pct_passed})
  end

  private
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end
end
