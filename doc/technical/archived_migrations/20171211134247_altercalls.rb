class Altercalls < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenge_call_responses, :first_name
    remove_column :challenge_call_responses, :family_name
    remove_column :challenge_call_responses, :description
    add_column :challenge_call_responses, :challenge_description, :text, after: :organization
    add_column :challenge_call_responses, :contact_name, :string, after: :id
  end
end
