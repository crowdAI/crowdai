class RenameEvaluation < ActiveRecord::Migration
  def change
    rename_column :challenges, :evaluation_rendered, :evaluation
  end
end
