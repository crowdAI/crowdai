class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_competition


  def index
    @topics = @competition.topics
    @headline_post = Post.find_by_sql(headline_sql).first  # TODO move into model layer based on answers or views
  end

  def show
  end

  def new
    @topic = @competition.topics.new
  end

  def edit
  end

  def create
    @topic = @competition.topics.new(topic_params)

    if @topic.save
      redirect_to competition_topics_path(@competition), notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to competition_topics_path(@competition), notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to competition_topics_path(@competition), notice: 'Topic was successfully destroyed.'
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def topic_params
      params.require(:topic).permit(:competition_id, :user_id, :topic, :sticky, :views, :posts_count)
    end

    def headline_sql
      sql = %Q[
        select p.id, substring(p.post from 0 for 40) as post, p.topic_id, u.name, t.topic as "topic_text"
        from posts p, topics t, users u
        where p.flagged = false
        and p.topic_id = t.id
        and p.user_id = u.id
        and t.competition_id = #{@competition.id}
        order by p.created_at desc
        limit 1
      ]
    end
end
