ActiveAdmin.register ChallengeCall do

  sidebar "Details", only: [:show, :edit] do
    ul do
      li link_to "Responses", admin_challenge_call_challenge_call_responses_path(challenge_call.id)
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

end
