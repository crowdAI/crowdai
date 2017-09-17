class AddGradingStatusToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :grading_status_cd, :string, default: 'ready'
    Submission.find_each do |submission|
      if submission.score.blank? && submission.grading_message.blank?
        submission.grading_status = 'ready'
      else
        if submission.score.present?
          submission.grading_status = 'graded'
        end
        if submission.grading_message.present?
          submission.grading_status = 'failed'
        end
      end
      puts submission.inspect
      submission.save!
    end
  end
end
