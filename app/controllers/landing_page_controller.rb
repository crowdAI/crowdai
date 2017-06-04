class LandingPageController < ApplicationController
  before_action :terminate_challenge, only: [:index]
  skip_before_action :authenticate_participant!

  def index
    @challenges = policy_scope(Challenge).limit(3)
  end

  def host
  end

end
