class PagesController < ApplicationController
  skip_before_action :authenticate_participant!

  def contact
  end

  def privacy
  end

  def terms
  end
end
