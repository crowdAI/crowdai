class AddCountryCdToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :country_cd, :string
  end
end
