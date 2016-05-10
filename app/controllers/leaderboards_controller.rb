class LeaderboardsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_leaderboard, only: [:show]
  before_action :set_challenge

  def index
    @leaderboards = @challenge.leaderboards
  end

  def show
  end

  private
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
end
