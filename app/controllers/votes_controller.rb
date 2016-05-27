class VotesController < ApplicationController
  before_action :set_votable
  respond_to :js

  def create #vote
    @vote = @votable.votes.new
    @vote.participant = current_participant
    @vote.save
    @votable.update(vote_count: @votable.votes.count)
    render 'votes/refresh_vote_link'
  end

  def destroy #unvote
    Vote.destroy(params[:id])
    @votable.update(vote_count: @votable.votes.count)
    render 'votes/refresh_vote_link'
  end

  private
  def set_votable
    params.each do |key,val|
      if key =~ /(.+)_id$/
        @votable = $1.classify.constantize.find(val)
        break
      end
    end
  end

end
