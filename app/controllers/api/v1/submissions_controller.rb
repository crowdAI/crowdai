class Api::V1::SubmissionsController < Api::V1::BaseController
  before_action :set_submission

  def update
    #if auth_by_api_key == false
    #  render json: {message: "submission #{@submission.id} authorised"}, status: :unauthorized
    #end
    # curl -X PUT -G http://localhost:3000/api/v1/submissions/1 -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="afbadb4ff8485c0adcba486b4ca90cc4"'
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

  def auth_by_api_key
    api_key = '***REMOVED***'
    authorised = false
    authenticate_or_request_with_http_token do |token, options|
      if token == api_key
        authorised = true
      end
    end
    return authorised
  end



end


# https://labs.kollegorna.se/blog/2015/04/build-an-api-now/
# http://railscasts.com/episodes/352-securing-an-api?view=asciicast
# http://resistor.io/blog/2013/08/07/mimimal-api-authentication-on-rails/
# http://hawkins.io/2012/03/state_of_rails_apis/
# http://gouthamanbalaraman.com/blog/python-multiprocessing-as-a-task-queue.html
