class LandingPageController < ApplicationController
  skip_filter :authenticate_participant!

  def index
    @challenges = Challenge.where(status_cd: 'running')
  end
end
