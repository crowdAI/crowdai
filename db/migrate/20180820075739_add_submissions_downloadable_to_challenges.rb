class AddSubmissionsDownloadableToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :submissions_downloadable, :boolean, default: false
    execute "update challenges set submissions_downloadable = false;"
  end
end
