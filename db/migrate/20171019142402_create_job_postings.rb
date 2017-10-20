class CreateJobPostings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.string :organisation
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.date :posting_date
      t.date :closing_date
      t.string :status_cd
      t.text :description_markdown
      t.text :description
      t.boolean :remote, default: true
      t.string :location
      t.string :country
      t.integer :page_views

      t.timestamps
    end
  end
end
