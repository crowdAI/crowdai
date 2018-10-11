class JobPostingsController < InheritedResources::Base
  before_action :set_job_posting, only: [:show]

  def index
    if current_participant.try(:admin?)
      @job_postings = JobPosting.all
    else
      @job_postings = JobPosting.where(status_cd: 'open')
    end
  end

  def show
    @job_posting.record_page_view
  end

  def set_job_posting
    @job_posting = JobPosting.find(params[:id])
  end

end
