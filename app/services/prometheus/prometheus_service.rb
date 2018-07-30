class Prometheus::PrometheusService

  def event_logger(event_name:, payload:, count:)
    EventLog.create!(
      event_name: event_name,
      payload: payload,
      count: count)
  end
end
