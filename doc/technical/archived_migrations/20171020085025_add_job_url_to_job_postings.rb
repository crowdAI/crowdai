class AddJobUrlToJobPostings < ActiveRecord::Migration[5.1]
  def change
    add_column :job_postings, :job_url, :string
  end
end
