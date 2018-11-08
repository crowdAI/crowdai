class Inviteename < ActiveRecord::Migration[5.2]
  def change
	  add_column :invitations, :invitee_name, :string
  end
end
