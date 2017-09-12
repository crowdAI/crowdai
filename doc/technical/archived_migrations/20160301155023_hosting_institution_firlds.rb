class HostingInstitutionFirlds < ActiveRecord::Migration
  def change
	remove_column :hosting_institutions, :contact_person
 	remove_column :hosting_institutions, :contact_phone
 	remove_column :hosting_institutions, :contact_email
	add_column :hosting_institutions, :contact_user_id, :integer
  end
end
