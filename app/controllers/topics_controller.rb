class TopicsController < ApplicationController
  before_filter :authenticate_participant!, except: [:index, :show]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge


  def index
    @topics = @challenge.topics
  end

  def show
  end

  def new
    @topic = @challenge.topics.new
  end

  def edit
  end

  def create
    @topic = @challenge.topics.new(topic_params)
    if @topic.save
      redirect_to challenge_topics_path(@challenge), notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
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
    end

    def set_challenge
      @challenge = Challenge.friendly.find(params[:challenge_id])
    end

    def topic_params
      params.require(:topic).permit(:challenge_id, :participant_id, :topic, :sticky, :views, :posts_count)
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
