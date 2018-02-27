class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.references :challenge, foreign_key: true
      t.references :participant, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
