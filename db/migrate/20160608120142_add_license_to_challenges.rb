class AddLicenseToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :license, :text
    add_column :challenges, :license_markdown, :text
  end
end
