ActiveAdmin.register JobPosting do

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :posting_date
    column :closing_date
    column :location
    column :country
    column :remote
    column :page_views
    actions
  end

  filter :country
  filter :remote
  filter :posting_date
  filter :closing_date

end
