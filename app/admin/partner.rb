ActiveAdmin.register Partner do

  controller do
    def permitted_params
      params.permit!
    end
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |partner|
      partner.update(visible: true)
    end
    redirect_to collection_path, alert: "Updated."
  end

  batch_action :deactivate do |ids|
    batch_action_collection.find(ids).each do |partner|
      partner.update(visible: false)
    end
    redirect_to collection_path, alert: "Updated."
  end

  index do
    selectable_column
    column "Image" do |partner|
      image_tag(partner.image_file.url, width: '50')
    end
    column :name
    column :organizer
    column :visible
    column :seq
    actions
  end

  show do |partner|
    attributes_table do
      row :name
      row :image_file do
        image_tag(partner.image_file.url, width: 150)
      end
      row :organizer
      row :visible
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Organizer" do
      f.input :organizer,
        :as => :select,
        :collection => Organizer.all.sort.collect {|organizer| [organizer.organizer, organizer.id] }
      f.input :name
      f.input :image_file,
        as: :file,
        hint: f.object.image_file.present? ? image_tag(f.object.image_file.url) : content_tag(:span, "no portrait yet")
      f.input :visible
      f.input :seq
    end
    f.actions
  end

end
