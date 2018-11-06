class AddDatasetTocToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :require_toc_acceptance, :boolean, default: false
    execute "update challenges set require_toc_acceptance = false;"
  end
end
