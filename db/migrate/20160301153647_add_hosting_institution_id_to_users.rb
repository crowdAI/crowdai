class AddHostingInstitutionIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :hosting_institution, index: true, foreign_key: true
  end
end
