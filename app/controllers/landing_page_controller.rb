class LandingPageController < ApplicationController
  skip_filter :authenticate_user!

  def index
    @competitions = Competition.all
  end
end
