class RenameTimelinesToEvents < ActiveRecord::Migration
  def change
     rename_table :timelines, :events
     
  end
end
