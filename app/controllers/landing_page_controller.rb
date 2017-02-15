class LandingPageController < ApplicationController
  before_action :terminate_challenge, only: [:index]
  skip_filter :authenticate_participant!

  def index
    @challenges = policy_scope(Challenge)
    @articles = policy_scope(Article)
    load_gon
  end

end
