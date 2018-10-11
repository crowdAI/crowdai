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

  filter :id
  filter :country
  filter :remote
  filter :posting_date
  filter :closing_date
  filter :status

  form do |f|
    f.inputs do
      f.input :title
      f.input :status,
        as: :select,
        collection:  enum_option_pairs(JobPosting, :status),
        include_blank: false
      f.input :posting_date
      f.input :closing_date
      f.input :location
      f.input :country
      f.input :remote
      f.input :description
    end
    f.actions
  end

  show do |job|
    attributes_table do
      row :title
      row :status
      row :posting_date
      row :closing_date
      row :location
      row :country
      row :remote
      row :description do
        sanitize(job.description)
      end
      row :created_at
      row :updated_at
    end
  end



end
