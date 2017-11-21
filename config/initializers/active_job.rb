ActiveJob::Base.queue_adapter = :sidekiq
Sidekiq.default_worker_options = {
  unique: :until_executing,
  unique_args: ->(args) { [ args.first.except('job_id') ] }
}
