class LandingPageController < ApplicationController
  skip_filter :authenticate_participant!

  def index
    @challenges = Challenge.all
  end
end
