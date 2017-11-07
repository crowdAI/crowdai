class AddFirstNameToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :first_name, :string
  end
end
