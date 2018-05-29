ActiveAdmin.register Blog do

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :seq
    column :title
    column :participant
    column :published
    column :vote_count
    column :view_count
    actions
  end

  form do |f|
    f.inputs do
      f.input :participant
      f.input :title
      f.input :seq
      f.input :published
      f.input :body_markdown
    end
    f.actions
  end

  show do |blog|
    attributes_table do
      row :participant
      row :title
      row :seq
      row :published
      row :body do
        sanitize(blog.body)
      end
      row :created_at
      row :updated_at
    end
  end

end
