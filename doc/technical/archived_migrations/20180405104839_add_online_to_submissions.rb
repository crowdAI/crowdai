class AddOnlineToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :online_submission, :boolean, default: false
    execute "update submissions set online_submission = false;"
  end
end
