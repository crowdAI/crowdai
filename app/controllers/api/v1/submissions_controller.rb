class Api::V1::SubmissionsController < Api::V1::BaseController
  before_action :set_submission

  def update
    # curl -X PUT -G http://localhost:3000/api/v1/submissions/9 -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'
    @submission.update({score: params[:score], score_secondary: params[:score_secondary], grading_status_cd: 'graded'})
    if @submission.save!
      render json: {message: "submission #{@submission.id} scored"}, status: :accepted
    else
      render json: {message: "submission #{@submission.id} errored"}, status: :internal_server_error
    end
  end

  private
  def submissions_params
    params.require(:submission).permit(:id,:score,:score_secondary)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

end
