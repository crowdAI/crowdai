class LandingPageController < ApplicationController
  before_action :terminate_challenge, only: [:index]
  skip_filter :authenticate_participant!

  def index
    Rails.logger.info "sanity check"
    @challenges = policy_scope(Challenge).limit(5)
  end

  def host
    @organizer_application = OrganizerApplication.new
  end

end
