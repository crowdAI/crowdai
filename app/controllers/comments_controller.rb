class CommentsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_topic_and_challenge
  #after_action :notify_subscribers, only: [:create]


  def new
    @comments = @topic.comments("created_at DESC")
    @comment = @topic.comments.new
   end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to new_topic_comment_path(@topic), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to new_topic_comment_path(@topic), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @comment.destroy
    redirect_to new_topic_comment_path(@topic), notice: 'Comment was successfully deleted.'
  end

  private
    def set_comment
      @comment = Comment.friendly.find(params[:id])
    end

    def set_topic_and_challenge
      @topic = Topic.friendly.find(params[:topic_id])
      @challenge = @topic.challenge
    end

    def comment_params
      params.require(:comment).permit(:topic_id, :participant_id, :comment_markdown, :votes, :flagged, :notify)
    end

    def notify_subscribers
      PostNotificationJob.perform_later(@post)
    end
end
