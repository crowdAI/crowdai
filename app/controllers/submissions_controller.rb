class SubmissionsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :set_submissions_remaining

  def index
    @submissions = @challenge.submissions.where(participant_id: current_participant)
  end

  def show
  end

  def new
    @submission = @challenge.submissions.new
    # TODO for the first challenge we are working with 2 files.
    # Make this challenge config data in next release
    @submission.submission_files.build(seq: 0)
    @submission.submission_files.build(seq: 1)
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      SubmissionGraderJob.perform_later(submission_id: @submission.id)
      redirect_to challenge_submissions_path(@challenge)
    else
      @errors = @submission.errors
      render :new
    end
  end

  def update
    if @submission.update(submission_params)
      redirect_to [@challenge,@submission], notice: 'Submission was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @submission.destroy
    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end



  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

    def submission_params
      params.require(:submission).permit(:challenge_id, :participant_id, :team_id, :description, :evaluated, :score, :submission_type,
                                  submission_files_attributes: [:id, :seq, :submission_file_s3_key, :_delete])
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "submission_files/#{SecureRandom.uuid}/${filename}",
                                                 success_action_status: '201',
                                                 acl: 'public-read')
    end

    def set_submissions_remaining
      submissions_today = Submission.where("participant_id = ? and created_at >= ?", current_participant.id, Time.now - 24.hours).count
      @submissions_remaining = (5 - submissions_today)
    end
end
