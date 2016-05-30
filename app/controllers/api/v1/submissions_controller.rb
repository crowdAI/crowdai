class Api::V1::SubmissionsController < Api::V1::BaseController
  before_action :set_submission

  def update
    @submission.update(grading_params)
    if @submission.save!
      render json: {message: "submission #{@submission.id} scored"}, status: :accepted
    else
      render json: {message: "submission #{@submission.id} errored"}, status: :internal_server_error
    end
  end

  private
  def set_submission
    @submission = Submission.find(params[:id])
  end

  def grading_params
    case params[:grading_status]
    when 'graded'
        {score: params[:score],
         score_secondary: params[:score_secondary],
         grading_status_cd: 'graded',
         grading_message: nil}
      when 'failed'
        {score: nil,
         score_secondary: nil,
         grading_status_cd: 'failed',
         grading_message: params[:grading_message]}
      when 'submitted'
        {score: nil,
         score_secondary: nil,
         grading_status_cd: 'submitted',
         grading_message: nil}
    end
  end

end
