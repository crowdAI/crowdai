class AddSubmissionsPageToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :submissions_page, :boolean
    execute "update challenges set submissions_page = 't';"
  end
end
