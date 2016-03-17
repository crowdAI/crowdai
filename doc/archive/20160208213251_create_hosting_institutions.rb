class CreateHostingInstitutions < ActiveRecord::Migration
  def change
    create_table :hosting_institutions do |t|
      t.string :institution
      t.text :address
      t.text :description
      t.string :contact_person
      t.string :contact_phone
      t.string :contact_email

      t.timestamps null: false
    end
  end
end
