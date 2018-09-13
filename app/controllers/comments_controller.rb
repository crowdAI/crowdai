class CommentsController < ApplicationController
  before_action :authenticate_participant!,
    only: [:create, :update, :destroy]
  before_action :set_comment,
    only: [:edit, :update, :destroy]
  before_action :set_topic_and_challenge
  respond_to :html, :js

  def new
    @challenge = @topic.challenge
    @author = @topic.participant

    @first_comment = @topic.comments
      .order(created_at: :asc).first
    @comments = @topic.comments
      .where.not(id: @first_comment.id).order(created_at: :asc)
    @comment = Comment.new(topic_id: @topic_id)
    if params[:quoted_comment_id]
      quoted_comment = Comment.find(params[:quoted_comment_id])
      @comment.comment_markdown = "> #{quoted_comment.comment_markdown}"
    end
    authorize @comment
   end

  def create
    rendered_html, mentioned_participant_ids = MarkdownService.new(markdown: comment_params[:comment_markdown], mentions_cache: params[:comment][:mentions_cache]).call
    @comment = @topic.comments.new(comment_params)
    @comment.comment = rendered_html
    authorize @comment

    if @comment.save
      EveryCommentNotificationJob
        .set(wait: 5.minutes)
        .perform_later(@comment.id)
      if mentioned_participant_ids.present?
        MentionsNotificationsJob
          .set(wait: 5.minutes)
          .perform_later(
            mentioned_participant_ids: mentioned_participant_ids, comment_id: @comment.id)
      end
      redirect_to new_topic_discussion_path(@topic),
        notice: 'Comment was successfully created.'
    else
      render :new
    end
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
    def set_comment
      @comment = Comment.find(params[:id])
      authorize @comment
    end

    def set_topic_and_challenge
      @topic = Topic.friendly.find(params[:topic_id])
      @challenge = @topic.challenge
    end

    def comment_params
      params.require(:comment)
            .permit(:topic_id,
                    :participant_id,
                    :comment_markdown,
                    :votes,
                    :flagged,
                    :notify)
    end

end
