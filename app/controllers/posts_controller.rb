class PostsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :set_topic_and_challenge


  def new
    @challenge_view = ChallengeView.find(@challenge.id)
    @posts = @topic.posts("created_at DESC")
    @post = @topic.posts.new
    if params[:quote]
     quote_post = Post.find(params[:quote])
     if quote_post
       @post.post = "[quote]#{quote_post.post}[/quote]"
     end
   end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to new_topic_post_path(@topic), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to new_topic_post_path(@topic), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to new_topic_post_path(@topic), notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_topic_and_challenge
      @topic = Topic.find(params[:topic_id])
      @challenge = @topic.challenge
    end

    def post_params
      params.require(:post).permit(:topic_id, :participant_id, :post, :votes, :flagged, :notify)
    end
end
