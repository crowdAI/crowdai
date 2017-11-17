class LandingPageController < ApplicationController
  #before_action :terminate_challenge, only: [:index]

  def index
    @challenges = policy_scope(Challenge).limit(5)
  end

  def host
    @organizer_application = OrganizerApplication.new
  end
end
