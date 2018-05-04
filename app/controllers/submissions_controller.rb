class SubmissionsController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_submission,
    only: [:show, :edit, :update ]
  before_action :set_challenge
  before_action :set_s3_direct_post,
    only: [:new, :edit, :create, :update]
  before_action :set_submissions_remaining
  layout :set_layout
  respond_to :html, :js

  def index
    @submissions = @challenge
      .submissions
      .order('created_at desc')
      .page(params[:page])
      .per(10)
    @challenge_round_id = @challenge.challenge_rounds.where(active: true)
  end

  def show
    if !@challenge.completed? && (@submission.participant_id != current_participant.id && !current_participant.admin?)
      redirect_to '/', notice: "You don't have permission for this action."
    else
      @presenter = SubmissionDetailPresenter.new(
        submission: @submission,
        challenge: @challenge,
        view_context: view_context
      )
      render :show
    end
  end

  def new
    @clef_primary_run_disabled = clef_primary_run_disabled?
    @submissions_remaining, @reset_dttm = SubmissionsRemainingQuery.new(
      challenge: @challenge,
      participant_id: current_participant.id
    ).call
    @submission = @challenge.submissions.new
    @submission.submission_files.build
    authorize @submission
    #@challenge.submission_file_definitions.each do |file|
    #  @submission.submission_files.build(seq: file.seq)
    #end
  end

  def create
    @submission = @challenge.submissions.new(
      submission_params
      .merge(
        participant_id: current_participant.id,
        online_submission: true))
    authorize @submission
    if @submission.save
      SubmissionGraderJob.perform_later(@submission.id)
      #notify_admins
      redirect_to challenge_submissions_path(@challenge),
        notice: 'Submission accepted.'
    else
      @errors = @submission.errors
      render :new
    end
  end

  def edit
    authorize @submission
  end

  def update
    authorize @submission
    if @submission.update(submission_params)
      redirect_to @challenge,
        notice: 'Submission updated.'
    else
      render :edit
    end
  end

  def destroy
    submission = Submission.find(params[:id])
    submission.destroy
    redirect_to challenge_leaderboards_path(@challenge),
      notice: 'Submission was successfully destroyed.'
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
      authorize @submission
    end

    def set_challenge
      @challenge = Challenge.friendly.find(params[:challenge_id])
    end

    def grader_logs
      if @challenge.grader_logs
        s3_key = "grader_logs/#{@challenge.slug}/grader_logs_submission_#{@submission.id}.txt"
        s3 = S3Service.new(s3_key)
        @grader_logs = s3.filestream
      end
      return @grader_logs
    end

    def submission_params
      params
        .require(:submission)
        .permit(
          :challenge_id,
          :participant_id,
          :description_markdown,
          :score,
          :score_secondary,
          :grading_status,
          :grading_message,
          :api,
          :docker_configuration_id,
          :clef_method_description,
          :clef_retrieval_type,
          :clef_run_type,
          :clef_primary_run,
          :clef_other_info,
          :clef_additional,
          :online_submission,
          submission_files_attributes: [
            :id,
            :seq,
            :submission_file_s3_key,
            :_delete])
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET
        .presigned_post(
          key: "submission_files/challenge_#{@challenge.id}/#{SecureRandom.uuid}_${filename}",
          success_action_status: '201',
          acl: 'private')
    end

    def set_submissions_remaining
      @submissions_remaining = @challenge.submissions_remaining(current_participant.id)
    end

    def notify_admins
      Admin::SubmissionNotificationJob.perform_later(@submission)
    end

    def clef_primary_run_disabled?
      return true unless @challenge.organizer.clef?

      sql = %Q[
        SELECT 'X'
        FROM submissions s
        WHERE s.challenge_id = #{@challenge.id}
        AND s.participant_id = #{current_participant.id}
        AND ((s.clef_primary_run IS TRUE
              AND s.grading_status_cd = 'graded')
              OR s.grading_status_cd IN ('ready', 'submitted', 'initiated'))
      ]
      res = ActiveRecord::Base.connection.select_values(sql)
      res.any?
    end

    def set_layout
      return 'bare' if action_name == 'show'
      return 'application'
    end

end
