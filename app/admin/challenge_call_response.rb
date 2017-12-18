ActiveAdmin.register ChallengeCallResponse do
  belongs_to :challenge_call #, parent_class: ChallengeCall
  navigation_menu :challenge_call

  controller do
    #def find_resource
    #  scoped_collection.friendly.find(params[:challenge_call_id])
    #end
    #def find_resource
    #  ChallengeCall.friendly.find(params[:challenge_call_id])
      #scoped_collection.friendly.find(params[:id])
    #end
  end

  show do
    attributes_table do
      row :email
      row :organization
    end
  end

=begin
  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  index do
    selectable_column
    column :id
    column :challenge_title
    column :contact_name
    column :organization
    column :phone
    actions
  end
=end

end
