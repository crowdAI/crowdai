class AddDiscussionsVisibleToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :discussions_visible, :boolean, default: true
    execute "update challenges set discussions_visible = true;"
  end
end
