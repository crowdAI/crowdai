class Api::ChallengesController < Api::BaseController
  before_action :auth_by_admin_api_key

  def index
    challenges = Challenge.all
    message = challenges.as_json(
              { only: [
                :id,
                :challenge,
                :organiser_id,
                :status_cd,
                :primary_sort_order_cd,
                :secondary_sort_order_cd,
                :perpetual_challenge,
                :grading_factor ]
              })
    render json: { message: message }, status: :ok
  end

  def show
    challenge = Challenge.find(params[:id])
    if challenge.present?
      message = challenge.as_json(
                { only: [
                  :id,
                  :challenge,
                  :organiser_id,
                  :status_cd,
                  :primary_sort_order_cd,
                  :secondary_sort_order_cd,
                  :perpetual_challenge,
                  :grading_factor
                  ],
                include: [:challenge_rounds]})
      status = :ok
    else
      message = "No challenge could be found for this ID"
      status = :not_found
    end
    render json: { message: message }, status: status
  end
end
