class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all
  end

  def show
  end

  def new
    @competition = Competition.new
  end

  def edit
  end

  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      redirect_to @competition, notice: 'Competition was successfully created.'
    else
      render :new
    end
  end

  def update
    if @competition.update(competition_params)
      redirect_to @competition, notice: 'Competition was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @competition.destroy
    redirect_to competitions_url, notice: 'Competition was successfully destroyed.'
  end

  private
    def set_competition
      @competition = Competition.find(params[:id])
    end

    def competition_params
      params.require(:competition)
            .permit(:hosting_institution_id, :competition, :start_date, :end_date,
                    :status, :description, :evaluation, :evaluation_criteria,
                    :rules, :prizes, :resources, :submission_instructions,
                    dataset_attributes: [:id, :competition_id, :description, :_destroy],
                    timelines_attributes: [:id, :competition_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :competition_id, :user_id, :team_id, :evaluated, :score,
                                            :ranking, :submission_type, :withdrawn, :withdrawn_date, :_destroy ]
                    )
    end
end
