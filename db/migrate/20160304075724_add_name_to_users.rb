class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :name, :string
    add_column :users, :email_public, :boolean, default: false
    add_column :users, :bio, :text
    add_column :users, :website, :string
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string  
end
end
