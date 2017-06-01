ActiveAdmin.register Leaderboard do
  belongs_to :challenge
  navigation_menu :challenge

  index do
    selectable_column
    column :row_num
    column :participant_id
    column :name
    column :entries
    column :score
    column :score_secondary
    column :media_content_type
  end

end
