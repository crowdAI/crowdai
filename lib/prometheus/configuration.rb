module Prometheus
  module Configuration

    # Create a default Prometheus registry for our metrics.
    prometheus = Prometheus::Client.registry

    # Create a simple gauge metric.
    #GAUGE_EXAMPLE = Prometheus::Client::Gauge.new(:gauge_example, 'A simple gauge that rands between 1 and 100 inclusively.')

    # Register GAUGE_EXAMPLE with the registry we previously created.
    #prometheus.register(GAUGE_EXAMPLE)

    SUBMISSION_COUNTER = Prometheus::Client::Counter.new(:submission, 'A crowdAI submission has been made.')

    PARTICIPANT_COUNTER =
    Prometheus::Client::Counter.new(:participant, 'A new participant has signed up to crowdAI.')

    prometheus.register(SUBMISSION_COUNTER)
    prometheus.register(PARTICIPANT_COUNTER)
  end
end
