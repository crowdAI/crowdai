class Prometheus::ParticipantCounterService < Prometheus::PrometheusService
  include Prometheus::Controller

  def call
    payload = { action: 'create' }
    PARTICIPANT_COUNTER.increment(payload, 1)
  end

end
