class BaseJob < ActiveJob::Base
  queue_as :default

  around_perform do |job, block|
    log_process_start(job)
    block.call
    log_process_end(job)
  end


  def log_process_start(job)
    logfile = Rails.root.join('log',"#{self.class}","#{self.class}-#{job.job_id}.log")
    FileUtils.mkdir_p(File.dirname(logfile)) unless File.exist?(File.dirname(logfile))
    @logger = ActiveSupport::Logger.new(logfile)
    @logger.info("job: #{job.to_yaml}")
    @logger.info("\nPROCESS START\n")
  end


  def log_process_end(job)
    @logger.info("\nPROCESS COMPLETED\n")
  end
end
