class AddApprovedToHostingInstitutions < ActiveRecord::Migration
  def change
    add_column :hosting_institutions, :approved, :boolean, default: false
  end
end
