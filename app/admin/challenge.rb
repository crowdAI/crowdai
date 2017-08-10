ActiveAdmin.register Challenge do
  #config.filters = false

  sidebar "Challenge Configuration", only: [:show, :edit] do
    ul do
      li link_to "Dataset Files", admin_challenge_dataset_files_path(challenge)
      li link_to "Submission File Definition", admin_challenge_submission_file_definitions_path(challenge)
    end
  end

  sidebar "Challenge Details", only: [:show, :edit] do
    ul do
      li link_to "Leaderboard",   admin_challenge_leaderboards_path(challenge)
      li link_to "Submissions",   admin_challenge_submissions_path(challenge)
      li link_to "Topics",        admin_challenge_topics_path(challenge)
    end
  end

  filter :status_cd

  index do
    selectable_column
    column :id
    column :challenge
    column :status
    column :page_views
    column :participant_count
    column :submission_count
    actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Challenge" do
      f.input :organizer, :as => :select, :collection => Organizer.all.collect {|organizer| [organizer.organizer, organizer.id] }
      f.input :challenge
      f.input :status
      f.input :tagline
      f.input :score_title
      f.input :primary_sort_order
      f.input :score_secondary_title
      f.input :secondary_sort_order
      f.input :perpetual_challenge
      f.input :grading_factor
      f.input :grader
      f.input :challenge_client_name
      f.input :description_markdown
      f.input :evaluation_markdown
      f.input :rules_markdown
      f.input :prizes_markdown
      f.input :resources_markdown
      f.input :submission_instructions_markdown
      f.input :license_markdown
      f.input :dataset_description_markdown
    end
    f.actions
  end


end
