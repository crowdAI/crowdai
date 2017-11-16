class Adddfts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :participant_clef_tasks, :approved, false
  end
end
