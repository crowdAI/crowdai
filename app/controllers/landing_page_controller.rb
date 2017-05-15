class LandingPageController < ApplicationController
  before_action :terminate_challenge, only: [:index]
  skip_filter :authenticate_participant!

  def index
    @challenges = cell(:challenge_index_detail, collection: policy_scope(Challenge).limit(3))
  end

end
