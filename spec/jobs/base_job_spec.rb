require 'rails_helper'

RSpec.describe BaseJob, type: :job do
  pending "add some examples to (or delete) #{__FILE__}"

  
  describe '#log_process_start' do
    it 'works' do
      base_job = BaseJob.new
      job = double('job')
      result = base_job.log_process_start(job)
      expect(result).not_to be_nil
    end
  end

  
  describe '#log_process_end' do
    it 'works' do
      base_job = BaseJob.new
      job = double('job')
      result = base_job.log_process_end(job)
      expect(result).not_to be_nil
    end
  end


end
