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

  # GET /competitions
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      redirect_to @competition, notice: 'Competition was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /competitions/1
  def update
    if @competition.update(competition_params)
      redirect_to @competition, notice: 'Competition was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /competitions/1
  def destroy
    @competition.destroy
    redirect_to competitions_url, notice: 'Competition was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def competition_params
      params.require(:competition).permit(:hosting_institution_id, :competition, :start_date, :end_date, :status_cd, :description, :evaluation, :evaluation_criteria, :rules, :prizes, :resources)
    end
end
