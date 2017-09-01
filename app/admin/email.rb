ActiveAdmin.register Email do
  belongs_to :crowdai_mailer
  navigation_menu :mailer


  index do
    selectable_column
    column :id
    column :model_id
    column :participant_id
    column :status_cd
    actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
