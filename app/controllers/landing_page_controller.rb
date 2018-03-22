class LandingPageController < ApplicationController
  before_action :terminate_challenge, only: [:index]

  def index
    @challenges = policy_scope(Challenge).order(featured_sequence: :desc).limit(5)
  end

  def host
    @crowdai = ChallengeCall.where(crowdai: true).first
  end
end
