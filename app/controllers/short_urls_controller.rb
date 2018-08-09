class ShortUrlsController < ApplicationController

  def show
    submission = Submission.find_by(short_url: params[:short])
    if submission.present?
      redirect_to challenge_submission_path(submission.challenge_id, submission.id)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
