class PagesController < ApplicationController
  skip_filter :authenticate_participant!

  def contact
  end

  def privacy
  end

  def terms
  end
end
