class AddCityToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :city, :string, after: :address
  end
end
