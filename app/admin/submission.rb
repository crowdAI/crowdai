ActiveAdmin.register Submission do
  belongs_to :challenge, parent_class: Challenge
  navigation_menu :challenge

  filter :participant_id
  filter :name
  filter :media_content_type
  filter :score
  filter :score_secondary
  filter :grading_status_cd

  index do
    selectable_column
    column :id
    column :participant_id
    column :score
    column :score_secondary
    column :grading_status_cd
    column :post_challenge
    column :media_content_type
    column :updated_at
    actions
  end

  controller do
    def find_resource
      scoped_collection.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end


end
