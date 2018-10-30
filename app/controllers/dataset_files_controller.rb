class DatasetFilesController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_dataset_file,
    only: [:destroy, :edit, :update]
  before_action :set_challenge
  before_action :set_s3_direct_post,
    only: [:new, :create, :edit]

  def index
    @dataset_files = policy_scope(DatasetFile)
      .where(challenge_id: @challenge.id)
    @challenge_participant = @challenge
      .challenge_participants
      .find_by(participant_id: current_participant.id)
    if @challenge_participant.blank?
      @challenge_participant = ChallengeParticipant.create!(
        challenge_id: @challenge.id,
        participant_id: current_participant.id
      )
    end
  end

  def show
  end

  def new
    @dataset_file = @challenge
      .dataset_files.new
    authorize @dataset_file
  end

  def create
    @dataset_file = @challenge
      .dataset_files.new(dataset_file_params)
    if @dataset_file.save
      redirect_to challenge_dataset_files_path(@challenge),
        notice: 'Dataset file was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dataset_file.update(dataset_file_params)
      redirect_to challenge_dataset_files_path(@challenge),
        notice: 'Dataset file was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @dataset_file.dataset_file_s3_key.present?
      s3 = Aws::S3::Client.new
      s3.delete_object(key: @dataset_file.dataset_file_s3_key, bucket: ENV['AWS_S3_BUCKET'])
    end
    @dataset_file.destroy
    redirect_to challenge_dataset_files_path(@challenge),
      notice: "Dataset file #{@dataset_file.title} was deleted."
  end

  private
  def set_dataset_file
    @dataset_file = DatasetFile.find(params[:id])
    authorize @dataset_file
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end

  def dataset_file_params
    params
      .require(:dataset_file)
      .permit(
        :seq,
        :description,
        :evaluation,
        :visible,
        :title,
        :file_size,
        :external_url,
        :external_file_size,
        :dataset_file_s3_key,
        :hosting_location)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET
      .presigned_post(
        key: "dataset_files/challenge_#{@challenge.id}/#{SecureRandom.uuid}_${filename}",
        success_action_status: '201',
        acl: 'private')
  end

end
