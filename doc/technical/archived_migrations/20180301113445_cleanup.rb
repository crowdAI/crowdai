class Cleanup < ActiveRecord::Migration[5.1]
  def change
    execute "drop table submission_grades_backup_120218;"
    execute "drop table submissions_backup_120218;"
    execute "drop table submissions_backup_290917;"
  end
end
