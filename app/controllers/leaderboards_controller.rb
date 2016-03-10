class LeaderboardsController < ApplicationController
  before_action :set_leaderboard, only: [:show]
  before_action :set_competition

  def index
    @leaderboards = @competition.submissions
  end

  def show
  end

  private
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end
end
