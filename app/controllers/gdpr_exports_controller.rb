class GdprExportsController < ApplicationController
  before_action :authenticate_participant!
  respond_to :js

  def create
    GdprExportJob.perform_later(
      participant_id: current_participant.id)
  end

end
