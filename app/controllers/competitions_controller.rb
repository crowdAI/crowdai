# == Schema Information
#
# Table name: competitions
#
#  id                     :integer          not null, primary key
#  hosting_institution_id :integer
#  competition            :string
#  start_date             :date
#  end_date               :date
#  status_cd              :string
#  description            :text
#  evaluation             :text
#  evaluation_criteria    :text
#  rules                  :text
#  prizes                 :text
#  resources              :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
                    :rules, :prizes, :resources,
                    datasets_attributes: [:id, :competition_id, :description, :_destroy,
                        dataset_files_attributes: [:id, :seq, :filename, :filetype, :_destroy ]],
                    timelines_attributes: [:id, :competition_id, :seq, :event, :event_time, :_destroy ],
                    submissions_attributes: [:id, :competition_id, :user_id, :team_id, :evaluated, :score,
                                            :ranking, :submission_type, :withdrawn, :withdrawn_date, :_destroy ]
                    )
    end
end
