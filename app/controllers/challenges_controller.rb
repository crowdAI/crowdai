  class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def edit
  end

  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      redirect_to @challenge, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: 'Challenge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: 'Challenge was successfully destroyed.'
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge)
            .permit(:hosting_institution_id, :challenge, :start_date, :end_date,
                    :status, :description, :evaluation, :evaluation_criteria,
                    :rules, :prizes, :resources, :submission_instructions,
                    dataset_attributes: [:id, :challenge_id, :description, :_destroy],
                    timelines_attributes: [:id, :challenge_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :challenge_id, :user_id, :team_id, :evaluated, :score,
                                            :ranking, :submission_type, :withdrawn, :withdrawn_date, :_destroy ],
                    image_attributes: [:id, :image, :_destroy ]
                    )
    end
end
