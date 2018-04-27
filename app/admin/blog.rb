ActiveAdmin.register Blog do

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :title
    column :participant
    column :published
    column :vote_count
    column :view_count
    actions
  end

end
