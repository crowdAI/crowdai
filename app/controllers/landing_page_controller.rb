class LandingPageController < ApplicationController
  before_action :terminate_challenge, only: [:index]

  def index
    @challenges = policy_scope(Challenge)
      .order(featured_sequence: :desc)
      .limit(6)
    @partners = Partner
      .where(visible: true)
      .where.not(image_file: nil)
      .order(seq: :asc)
      .limit(8)
    @blog_posts = Blog
      .where(published: true)
      .order(seq: :asc)
      .limit(4)
  end

  def host
    @crowdai = ChallengeCall.where(crowdai: true).first
  end

end
