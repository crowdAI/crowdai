class AddDynamicContentToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :dynamic_content_flag, :boolean, default: false
    add_column :challenges, :dynamic_content, :text
  end
end
