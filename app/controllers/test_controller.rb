class TestController < ActionController::Base
  include Prometheus::Controller

  # A gauge is a metric that represents a single numerical value that can arbitrarily go up and down.
  def gauge
    #GAUGE_EXAMPLE
    #  .set({route: :gauge}, rand(0..100))
    Prometheus::SubmissionCounterService.new(submission_id: 9302).call
    respond_to do |r|
      r.any do
        render json: {
                 message: "Success",
               }, status: 200
      end
    end
  end

end
