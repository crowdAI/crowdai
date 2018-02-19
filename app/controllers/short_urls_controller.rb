class ShortUrlsController < ApplicationController

  def show
    leaderboard = Submission.find_by(short_url: params[:short])
    if leaderboard.present?
      redirect_to challenge_leaderboard_path(leaderboard.challenge_id, leaderboard.id)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
