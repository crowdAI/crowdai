class LandingPageController < ApplicationController
  skip_filter :authenticate_user!

  def index
    @challenges = Challenge.all
  end
end
