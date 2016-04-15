class Api::V1::SubmissionsController < Api::V1::BaseController
  skip_filter :authenticate_participant!
  before_action :set_submission

  def update
    @submission.update({score: params[:score], score_secondary: params[:score_secondary]})
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


# https://labs.kollegorna.se/blog/2015/04/build-an-api-now/
# http://railscasts.com/episodes/352-securing-an-api?view=asciicast
# http://resistor.io/blog/2013/08/07/mimimal-api-authentication-on-rails/
# http://hawkins.io/2012/03/state_of_rails_apis/
# http://gouthamanbalaraman.com/blog/python-multiprocessing-as-a-task-queue.html
