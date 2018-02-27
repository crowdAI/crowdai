class FixCheckbox < ActiveRecord::Migration[5.1]
  def change
    change_column_default :organizers, :clef_organizer, false
    execute "update organizers set clef_organizer = false;"
  end
end
