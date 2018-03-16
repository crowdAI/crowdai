ActiveAdmin.register ChallengeCall do

  sidebar "Details", only: [:show, :edit] do
    ul do
      li link_to "Responses", admin_challenge_call_challenge_call_responses_path(challenge_call)
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end

  filter :organizer, :as => :select, :collection => Organizer.all.collect {|organizer| [organizer.organizer, organizer.id] }
  filter :headline

  index do
    selectable_column
    column :id
    column :title
    column 'organizer' do |res|
      res.organizer.organizer
    end
    column :headline
    column :closing_date
    column :website
    column :crowdai
    column :reponses do |res|
      res.challenge_call_responses.count
    end
    column 'link' do |res|
      "https://www.crowdai.org/call-for-challenges/#{res.slug}/apply"
    end
    actions
  end

  form do |f|
    f.inputs "Challenge Call" do
      f.input :title
      f.input :organizer, :as => :select, member_label: :organizer
      f.input :headline
      f.input :description_markdown
      f.input :closing_date
      f.input :website
      f.input :crowdai
      f.input :slug, :input_html => { :disabled => true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row 'organizer' do |res|
        res.organizer.organizer
      end
      row :headline
      row 'description' do |res|
        simple_format(res.description)
      end
      row :closing_date
      row :website
      row :slug
      row :crowdai
      row 'link' do |res|
        "https://www.crowdai.org/call-for-challenges/#{res.slug}/apply"
      end
    end
  end

end
