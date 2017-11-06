class AddFlags < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_registrations, :hearted, :boolean, default: :false, after: :participant_id
    add_column :challenge_registrations, :forum, :boolean, default: :false, after: :participant_id
    add_column :challenge_registrations, :submitted, :boolean, default: :false, after: :participant_id
    add_column :challenge_registrations, :dataset_downloaded, :boolean, default: :false, after: :participant_id 
  end
end
