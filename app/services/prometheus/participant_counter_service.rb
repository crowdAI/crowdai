class Prometheus::ParticipantCounterService < Prometheus::PrometheusService
  include Prometheus::Controller

  def call
    count = 1
    payload = { action: 'create' }
    PARTICIPANT_COUNTER.increment(payload, count)
    event_logger(
      event_name: 'PARTICIPANT_COUNTER',
      payload: payload,
      count: count)
  end

end
