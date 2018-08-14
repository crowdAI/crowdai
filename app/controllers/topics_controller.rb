class TopicsController < ApplicationController
  before_action :authenticate_participant!, except: [:index, :show]
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :set_challenge
  after_action :verify_authorized, except: [:index]

  def index
    @topics = @challenge.topics.page(params[:page]).per(20)
  end

  def new
    @topic = @challenge.topics.new
    @comment = @topic.comments.new
    authorize @topic
  end

  def edit
  end

  def create
    @topic = @challenge.topics.new(topic_params)
    authorize @topic
    if @topic.save
      EveryTopicNotificationJob
        .set(wait: 5.minutes)
        .perform_later(@topic.id)
      redirect_to challenge_topics_path(@challenge), notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def update
    # https://github.com/norman/friendly_id/issues/185
    if @topic.update(topic_params)
      nested = params['topic']['comment']
      if nested.present?
        comment = Comment.find(nested['id'])
        comment.update(comment_markdown: nested['comment_markdown'])
      end
      redirect_to challenge_topics_path(@challenge), notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to challenge_topics_path(@challenge), notice: 'Topic was successfully destroyed.'
  end

  private
    def set_topic
      @topic = Topic.friendly.find(params[:id])
      authorize @topic
    end

    def set_challenge
      @challenge = Challenge.friendly.find(params[:challenge_id])
    end

    def topic_params
      params
        .require(:topic)
        .permit(:challenge_id,
                :participant_id,
                :topic,
                :sticky,
                :views,
                :posts_count,
                comments_attributes: [:id, :comment_markdown, :participant_id])
    end

    def headline_sql
      sql = %Q[
        select p.id, substring(p.post from 0 for 40) as post, p.topic_id, u.name, t.topic as "topic_text"
        from posts p, topics t, participants u
        where p.flagged = false
        and p.topic_id = t.id
        and p.participant_id = u.id
        and t.challenge_id = #{@challenge.id}
        order by p.created_at desc
        limit 1
      ]
    end
end
