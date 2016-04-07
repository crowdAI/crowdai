class RenameHostingInstitutionToOrganizer < ActiveRecord::Migration
  def change
    rename_table :hosting_institutions, :organizers
    rename_column :organizers, :institution, :organizer
    rename_column :challenges, :hosting_institution_id, :organizer_id
    rename_column :users, :hosting_institution_id, :organizer_id
    remove_column :users, :hosting_institution_primary
  end
end
