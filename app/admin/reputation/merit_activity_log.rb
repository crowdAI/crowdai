=begin
ActiveAdmin.register Merit::ActivityLog do
  menu parent: "Reputation"

  index do
    column :id
    column :action_id
    column :related_change_type
    column :related_change_id
    column :description
  end
end

Not working
"Polymorphic association does not support to compute class."
=end
