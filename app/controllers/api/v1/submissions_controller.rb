class Api::V1::SubmissionsController < Api::V1::BaseController

  def update
    SubmissionGrade.create!(grading_params)
    render json: {message: "submission #{params[:id]} scored"}, status: :accepted
  end

  private
  def grading_params
    case params[:grading_status]
    when 'graded'
        {submission_id: params[:id],
         score: params[:score],
         score_secondary: params[:score_secondary],
         grading_status_cd: 'graded',
         grading_message: nil}
      when 'failed'
        {submission_id: params[:id],
         score: nil,
         score_secondary: nil,
         grading_status_cd: 'failed',
         grading_message: params[:grading_message]}
      when 'submitted'
        {submission_id: params[:id],
         score: nil,
         score_secondary: nil,
         grading_status_cd: 'submitted',
         grading_message: nil}
    end
  end

end
