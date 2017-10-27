class AddAffiliationToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :affiliation, :string
  end
end
