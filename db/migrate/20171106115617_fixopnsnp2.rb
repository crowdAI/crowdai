class Fixopnsnp2 < ActiveRecord::Migration[5.1]
  def change
    execute "UPDATE submissions SET participant_id = 7 WHERE participant_id IS null;"
  end
end
