class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @challenges = policy_scope(Challenge)
    load_gon
  end


  def show
    authorize @challenge
    @challenge.record_page_view
    load_gon({percent_progress: @challenge.timeline.pct_passed})
  end


  def new
    @challenge = Challenge.new
    authorize @challenge
  end


  def edit
    authorize @challenge
    load_gon
  end


  def create
    @challenge = Challenge.new(challenge_params)
    authorize @challenge

    if @challenge.save
      redirect_to @challenge, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end


  def update
    authorize @challenge
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: 'Challenge was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    authorize @challenge
    @challenge.destroy
    redirect_to challenges_url, notice: 'Challenge was successfully destroyed.'
  end


  private
  def set_challenge
    @challenge = Challenge.friendly.find(params[:id])
    authorize @challenge
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
                    :submission_license, :api_required, :framework_required, :daily_submissions,
                    dataset_attributes: [:id, :challenge_id, :description, :_destroy],
                    events_attributes: [:id, :challenge_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :challenge_id, :participant_id, :_destroy ],
                    image_attributes: [:id, :image, :_destroy ],
                    submission_file_definitions_attributes: [:id, :challenge_id, :seq, :submission_file_description, :filetype, :file_required, :submission_file_help_text, :_destroy]
                    )
    end
end
