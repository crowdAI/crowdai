class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :set_topic_and_competition


  def new
    @posts = @topic.posts
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

    def set_topic_and_competition
      @topic = Topic.find(params[:topic_id])
      @competition = @topic.competition
    end

    def post_params
      params.require(:post).permit(:topic_id, :user_id, :post, :votes, :flagged, :notify)
    end
end
