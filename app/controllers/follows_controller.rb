class FollowsController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_followable
  respond_to :js

  def create
    @follow = @followable.follows.new
    @follow.participant = current_participant
    @follow.save
    render js: concept(Follow::Cell, @followable, current_participant: current_participant).(:refresh)
  end

  def destroy
    Follow.destroy(params[:id])
    render js: concept(Follow::Cell, @followable, current_participant: current_participant).(:refresh)
  end

  private
  def set_followable
    params.each do |key,val|
      if key =~ /(.+)_id$/
        @followable = $1.classify.constantize.find(val)
        break
      end
    end
  end

end
