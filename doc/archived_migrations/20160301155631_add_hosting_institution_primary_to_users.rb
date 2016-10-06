class AddHostingInstitutionPrimaryToUsers < ActiveRecord::Migration
  def change
    remove_column :hosting_institutions, :contact_user_id
    add_column :users, :hosting_institution_primary, :boolean, default: false
  end
end
