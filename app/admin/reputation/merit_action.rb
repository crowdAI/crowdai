ActiveAdmin.register Merit::Action do
  menu parent: "Reputation"

  index do
    column :id
    column :participant_id
    column :action_method
    column :had_errors
    column :target_model
    column :target_id
    column :processed
  end
end
