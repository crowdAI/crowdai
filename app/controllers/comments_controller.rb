class CommentsController < ApplicationController
  before_action :set_commentable
  respond_to :js

  def create #comment
    @commentable.comments.create(participant: current_participant, comment: comment_params[:comment])
    @commentable.update(comment_count: @commentable.comments.count)
    @comments = @commentable.comments
    render 'comments/refresh_comments'
  end

  def destroy #uncomment
    Comment.destroy(params[:id])
    @commentable.update(comment_count: @commentable.comments.count)
    @comments = @commentable.comments
    render 'comments/refresh_comments'
  end

  private
  def set_commentable
    params.each do |key,val|
      if key =~ /(.+)_id$/
        @commentable = $1.classify.constantize.friendly.find(val)
        break
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
