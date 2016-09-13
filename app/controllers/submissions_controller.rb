class SubmissionsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :grade, :execute]
  before_action :set_challenge
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :set_submissions_remaining

  def index
    if params[:participant_id] && @challenge.completed?
      @participant = Participant.find(params[:participant_id])
      @submissions = Submission.where(challenge_id: @challenge.id, participant_id: params[:participant_id], grading_status_cd: 'graded')
    else
      @submissions = current_participant.submissions.where(challenge_id: @challenge.id)
    end
    load_gon({percent_progress: @challenge.timeline.pct_passed})
  end


  def leaderboard
    if !@challenge.completed?
      redirect_to '/'
    else
      participant_id = params[:participant_id]
      @submissions = Submission.where(challenge_id: @challenge.id, participant_id: participant_id)
      load_gon({percent_progress: @challenge.timeline.pct_passed})
    end
  end


  def show
    if !@challenge.completed? && (@submission.participant_id != current_participant.id && !current_participant.admin?)
      redirect_to '/', notice: "You don't have permission for this action."
    else
      @participant = @submission.participant
      render :show
    end
  end

  def new
    @submission = @challenge.submissions.new
    @challenge.submission_file_definitions.each do |file|
      @submission.submission_files.build(seq: file.seq)
    end
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      if @challenge.automatic_grading
        SubmissionGraderJob.perform_later(@submission.id)
      end
      redirect_to challenge_submissions_path(@challenge)
    else
      @errors = @submission.errors
      render :new
    end
  end

  def destroy
    @submission.destroy
    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end

  def grade
    @job = SubmissionGraderJob.perform_later(@submission.id)
    render 'admin/submissions/refresh_submission_job'
  end

  def execute
    @job = SubmissionExecutionJob.perform_later(@submission.id)
    render 'admin/submissions/refresh_submission_job'
  end


  private
    def set_submission
      if params.include?(:submission_id)
        @submission = Submission.find(params[:submission_id])
      else
        @submission = Submission.find(params[:id])
      end
    end


    def set_challenge
      @challenge = Challenge.friendly.find(params[:challenge_id])
    end


    def submission_params
      params.require(:submission).permit(:challenge_id, :participant_id, :description_markdown, :score, :score_secondary, :grading_status, :grading_message, :framework, :api,
                                  submission_files_attributes: [:id, :seq, :submission_file_s3_key, :_delete])
    end


    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "submission_files/#{SecureRandom.uuid}/${filename}",
                                                 success_action_status: '201',
                                                 acl: 'public-read')
    end
    

    def set_submissions_remaining
      submissions_today = Submission.where("participant_id = ? and created_at >= ?", current_participant.id, Time.now - 24.hours).count
      @submissions_remaining = (@challenge.daily_submissions - submissions_today)
    end


end
