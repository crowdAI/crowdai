ActiveAdmin.register ChallengeCallResponse do

  belongs_to :challenge_call, finder: :find_by_slug #, parent_class: ChallengeCall
  navigation_menu :challenge_call

  index do
    selectable_column
    column :id
    column :challenge_title
    column :contact_name
    column :organization
    column :phone
    actions
  end

end
