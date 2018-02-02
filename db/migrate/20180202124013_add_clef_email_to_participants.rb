class AddClefEmailToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :clef_email, :boolean, default: false
  end
end
