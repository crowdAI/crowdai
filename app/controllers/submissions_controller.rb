class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_competition

  def index
    @submissions = @competition.submissions.where(user_id: params[:leader_id])
  end

  def show
  end

  def new
    @submission = @competition.submissions.new
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to [@competition,@submission], notice: 'Submission was successfully created.'
    else
      @errors = @submission.errors
      render :new
    end
  end

  def update
    if @submission.update(submission_params)
      redirect_to [@competition,@submission], notice: 'Submission was successfully updated.'
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

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def submission_params
      params.require(:submission).permit(:competition_id, :user_id, :team_id, :evaluated, :score, :ranking, :submission_type, :withdrawn, :withdrawn_date)
    end
end
