class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :disallow_anonymous, except: [:index, :show]

  def index
    if current_participant && current_participant.admin?
      @challenges = Challenge.all
    else
      @challenges = Challenge.where(status_cd: ['running','completed','perpetual'])
    end
    load_gon
  end


  def show
    @challenge.record_page_view
    load_gon({percent_progress: @challenge.timeline.pct_passed})
    if @challenge.draft?
      redirect_to '/' unless current_participant && current_participant.admin?
    end
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
                    :score_title, :score_secondary_title,
                    :description_markdown, :rules_markdown, :prizes_markdown, :resources_markdown,
                    :dataset_description_markdown, :submission_instructions_markdown,
                    :license, :license_markdown,
                    :perpetual_challenge, :automatic_grading,
                    :grader, :grading_factor, :answer_file_s3_key,
                    dataset_attributes: [:id, :challenge_id, :description, :_destroy],
                    events_attributes: [:id, :challenge_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :challenge_id, :participant_id, :_destroy ],
                    image_attributes: [:id, :image, :_destroy ]
                    )
    end
end
