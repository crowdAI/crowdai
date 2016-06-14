class PopulateTitles < ActiveRecord::Migration
  def change
    execute "update challenges set score_title = 'Mean F1', score_secondary_title = 'Mean Log Loss'"
  end
end
