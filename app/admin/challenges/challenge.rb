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
      li link_to "Topics", admin_challenge_topics_path(challenge)
    end
  end

  filter :id
  filter :status_cd
  filter :challenge

  index do
    selectable_column
    column :id
    column :challenge
    column :status
    column :page_views
    column :participant_count
    column :submission_count
    actions defaults: false do |challenge|
      link_to 'view', admin_challenge_path(challenge), class: 'view_link member_link'
    end
  end

  controller do
    actions :all, except: [:edit, :new]
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end

  member_action :purge, method: :delete do
    submissions = Submission.where(challenge_id: params[:id])
    submissions_count = submissions.count
    submissions.destroy_all
    redirect_to admin_challenge_path(params[:id]), flash: { notice: "#{submissions_count} submissions have been deleted." }
  end

  action_item :delete_submissions, only: :show  do
    link_to 'Delete all submissions', purge_admin_challenge_path(resource.id), method: :delete, data: { confirm: "You are about to delete all submissions for #{resource.challenge} challenge. Are you sure?" }
  end

end
