class ChallengesController < ApplicationController
  before_action :terminate_challenge, only: [:show, :index]
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]
  before_action :set_s3_direct_post, only: [:edit, :update]
  after_action :update_stats_job
  respond_to :html, :js

  def index
    @challenge_filter = params[:challenge_filter] ||= 'all'
    @all_challenges = policy_scope(Challenge)
    case @challenge_filter
    when 'all'
      #@challenges = Challenge.search "*", page: params[:page], per_page: 2
      @challenges = policy_scope(Challenge).page(params[:page]).per(20)
    when 'active'
      #@challenges = Challenge.search "*", where: {status_cd: 'running'}, page: params[:page], per_page: 2
      @challenges = policy_scope(Challenge).where(status_cd: ['running','starting_soon']).page(params[:page]).per(20)
    when 'completed'
      #@challenges = Challenge.search "*", where: {status_cd: 'completed'}, page: params[:page], per_page: 2
      @challenges = policy_scope(Challenge).where(status_cd: 'completed').page(params[:page]).per(20)
    end
  end


  def show
    authorize @challenge
    if !params[:version]  # dont' record page views on history pages
      @challenge.record_page_view
    end
  end


  def new
    @challenge = Challenge.new
    authorize @challenge
  end


  def edit
    authorize @challenge
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
    #authorize @challenge
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


  def regrade
    challenge = Challenge.friendly.find(params[:challenge_id])
    authorize challenge
    challenge.submissions.each do |s|
      #SubmissionGraderJob.perform_later(s.id)
    end
    @submission_count = challenge.submissions.count
    render 'challenges/form/regrade_status'
  end

  def regen_api_key
    @challenge = Challenge.friendly.find(params[:challenge_id])
    authorize @challenge
    @challenge.api_key = @challenge.generate_api_key
    @challenge.save!
    redirect_to edit_challenge_path(@challenge),notice: 'API Key regenerated.'
  end

  def remove_image
    @challenge = Challenge.friendly.find(params[:challenge_id])
    authorize @challenge
    @challenge.remove_image_file!
    @challenge.save
    redirect_to edit_challenge_path(@challenge), notice: 'Image removed.'
  end

  private
  def set_challenge
    @challenge = Challenge.friendly.find(params[:id])
    if params[:version]
      @challenge = @challenge.versions[params[:version].to_i].reify
    end
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
                    :submission_license, :api_required, :daily_submissions, :threshold, :online_grading,
                    :start_dttm, :end_dttm, :media_on_leaderboard,
                    :challenge_client_name,
                    :start_date,
                    :end_date,
                    :start_time,
                    :end_time,
                    :image_file,
                    dataset_attributes: [:id, :challenge_id, :description, :_destroy],
                    submissions_attributes: [:id, :challenge_id, :participant_id, :_destroy ],
                    image_attributes: [:id, :image, :_destroy ],
                    submission_file_definitions_attributes: [:id, :challenge_id, :seq, :submission_file_description, :filetype, :file_required, :submission_file_help_text, :_destroy]
                    )
    end


    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "answer_files/#{@challenge.slug}_#{SecureRandom.uuid}/${filename}",
                                                 success_action_status: '201',
                                                 acl: 'private')
    end

    def update_stats_job
      UpdateChallengeStatsJob.perform_later
    end

end
