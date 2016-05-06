class ChallengesController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def index
    if current_participant.admin?
      @challenges = Challenge.all
    else
      @challenges = Challenge.where(status_cd: 'running')
    end
  end

  def show
    @timeline = @challenge.timeline
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
            .permit(:id,:organizer_id, :challenge, :tagline,
                    :status, :description, :evaluation_markdown, :evaluation_criteria,
                    :rules, :prizes, :resources, :submission_instructions, :score_sort, :score_secondary_sort,
                    dataset_attributes: [:id, :challenge_id, :description, :_destroy],
                    events_attributes: [:id, :challenge_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :challenge_id, :participant_id, :team_id, :evaluated, :score,
                                            :ranking, :withdrawn, :withdrawn_date, :_destroy ],
                    image_attributes: [:id, :image, :_destroy ]
                    )
    end
end
