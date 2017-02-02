ActiveAdmin.register Challenge do

  sidebar "Challenge Details", only: [:show, :edit] do
    ul do
      li link_to "Dataset Files",      admin_challenge_dataset_files_path(challenge)
      li link_to "Submissions",   admin_challenge_submissions_path(challenge)
      li link_to "Topics",        admin_challenge_topics_path(challenge)
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :challenge
    column :status
    column :page_views
    column :participant_count
    column :submission_count
    actions
  end
end
