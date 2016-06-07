class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :disallow_anonymous, except: [:index, :show]

  def index
    if current_participant && current_participant.admin?
      @challenges = ChallengeView.all
    else
      @challenges = ChallengeView.where(status_cd: 'running')
    end
    load_gon
  end


  def show
    @challenge_view = ChallengeView.find(params[:id])
    @challenge.record_page_view
    load_gon({percent_progress: @challenge.timeline.pct_passed})
  end


  def new
    @challenge = Challenge.new
  end


  def edit
    load_gon
  end


  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to @challenge, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end


  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: 'Challenge was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: 'Challenge was successfully destroyed.'
  end


  private
  def set_challenge
    @challenge = Challenge.find(params[:id])
    redirect_to challenges_url if (!current_participant && @challenge.draft?)
  end


  def disallow_anonymous
    redirect_to challenges_url if !current_participant
  end


  def challenge_params
    params.require(:challenge)
          .permit(:id,:organizer_id, :challenge, :tagline,
                    :status, :description, :evaluation_markdown, :evaluation_criteria,
                    :rules, :prizes, :resources, :submission_instructions, :primary_sort_order, :secondary_sort_order,
                    :description_markdown, :rules_markdown, :prizes_markdown, :resources_markdown,
                    :dataset_description_markdown, :submission_instructions_markdown, :perpetual_challenge,
                    :grader, :grading_factor, :answer_file_s3_key,
                    dataset_attributes: [:id, :challenge_id, :description, :_destroy],
                    events_attributes: [:id, :challenge_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :challenge_id, :participant_id, :_destroy ],
                    image_attributes: [:id, :image, :_destroy ]
                    )
    end
end
