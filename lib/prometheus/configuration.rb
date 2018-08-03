module Prometheus
  module Configuration
    prometheus = Prometheus::Client.registry

    SUBMISSION_COUNTER = Prometheus::Client::Counter.new(:submission, 'A crowdAI submission has been made.')

    PARTICIPANT_COUNTER =
    Prometheus::Client::Counter.new(:participant, 'A new participant has signed up to crowdAI.')

    prometheus.register(SUBMISSION_COUNTER)
    prometheus.register(PARTICIPANT_COUNTER)
  end
end
