class AddDynamicContentTabToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :dynamic_content_tab, :string
  end
end
