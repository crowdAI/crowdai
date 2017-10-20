class JobPostingsController < InheritedResources::Base
  before_action :set_job_posting, only: [:show]

  def index
    @job_postings = JobPosting.where(status_cd: 'open')
  end

  def show
    @job_posting.record_page_view
  end

  def set_job_posting
    @job_posting = JobPosting.find(params[:id])
  end

end
