class DatasetFilesController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_dataset_file, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_filter :authenticate_admin, except: [:show, :index]

  def index
    if current_participant.admin?
      @dataset_files = @challenge.dataset_files
    else
      @dataset_files = @challenge.dataset_files.where(evaluation: false)
    end
    load_gon({percent_progress: @challenge.pct_passed})
  end

  def show
  end

  def new
    @dataset_file = @challenge.dataset_files.new
  end


  def create
    @dataset_file = @challenge.dataset_files.new(dataset_file_params)
    if @dataset_file.save
      redirect_to challenge_dataset_files_path(@challenge, @dataset_file),
                  notice: 'Dataset file was successfully created.'
    else
      render :new
    end
  end


  def destroy
    @dataset_file.destroy
    redirect_to challenge_dataset_files_path(@challenge),
                notice: 'Dataset file was successfully destroyed.'
  end

  private
    def set_dataset_file
      @dataset_file = DatasetFile.find(params[:id])
    end

    def set_challenge
      challenge = Challenge.friendly.find(params[:challenge_id])
      @challenge = ChallengesPresenter.new(challenge)
    end

    def dataset_file_params
      params.require(:dataset_file).permit(:dataset_id, :seq, :description, :evaluation, :dataset_file_s3_key)
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "dataset_files/challenge_#{@challenge.id}/#{SecureRandom.uuid}_${filename}",
                                                 success_action_status: '201',
                                                 acl: 'private')
    end

    def authenticate_admin
      redirect_to '/' unless current_participant && current_participant.admin?
    end
end
