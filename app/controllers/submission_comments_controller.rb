class SubmissionCommentsController < ApplicationController
  before_action :authenticate_participant!, only: [:create, :update, :destroy]
  before_action :set_submission_comment, only: [:edit, :update, :destroy]
  before_action :set_submission
  respond_to :html, :js

  def create
    @submission_comment = @submission.submission_comments.new(submission_comment_params)
    if @submission_comment.save
      #EveryCommentNotificationJob.set(wait: 5.minutes).perform_later(@comment.id)
      redirect_to challenge_leaderboard_path(@submission.challenge_id,@submission.id), notice: 'Comment was successfully created.'
    else
      render :new
    end
    authorize @submission_comment
  end

  def edit
    render 'edit'
  end

  def update
    if @comment.update(comment_params)
      redirect_to new_topic_comment_url(@topic), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.update(comment_markdown: '***This comment has been redacted by the administrator***')
    redirect_to new_topic_comment_url(@topic), notice: 'Comment was successfully redacted.'
  end

  private
    def set_submission_comment
      @comment = Comment.find(params[:id])
    end

    def set_submission
      @submission = Submission.find(params[:submission_id])
    end

    def submission_comment_params
      params.require(:submission_comment)
            .permit(:submission_id,
                    :comment_markdown)
            .merge(participant_id: current_participant.id)
    end

end
