class Prometheus::ParticipantCounterService
  include Prometheus::Configuration

  def call
    payload = { action: 'create' }
    PARTICIPANT_COUNTER.increment(payload, 1)
  end

end
