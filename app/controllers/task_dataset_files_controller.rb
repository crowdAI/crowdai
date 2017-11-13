class TaskDatasetFilesController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_task_dataset_file, only: [:destroy]
  before_action :set_clef_task
  before_action :set_s3_direct_post, only: [:new, :create]

  def index
    if current_participant.admin?
      @task_dataset_files = @clef_task.task_dataset_files
    else
      @task_dataset_files = @clef_task.task_dataset_files.where(evaluation: false)
    end
  end

  def show
  end

  def new
    @task_dataset_file = @clef_task.task_dataset_files.new
    authorize @task_dataset_file
  end

  def create
    @task_dataset_file = @clef_task.task_dataset_files.new(task_dataset_file_params)
    if @task_dataset_file.save
      redirect_to organizer_clef_tasks_path(@clef_task.organizer),
                  notice: 'Dataset file was successfully created.'
    else
      render :new
    end
  end

  def destroy
    s3 = Aws::S3::Client.new
    s3.delete_object(key: @task_dataset_file.dataset_file_s3_key, bucket: ENV['AWS_S3_BUCKET'])
    @task_dataset_file.destroy
    redirect_to organizer_clef_tasks_path(@clef_task.organizer),
        notice: "Dataset file #{@task_dataset_file.title} was deleted."
  end

  private
  def set_task_dataset_file
    @task_dataset_file = DatasetFile.find(params[:id])
  end

  def set_clef_task
    @clef_task = ClefTask.find(params[:clef_task_id])
  end

  def task_dataset_file_params
    params.require(:task_dataset_file)
          .permit(:seq,
                  :description,
                  :evaluation,
                  :title,
                  :dataset_file_s3_key)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "task_dataset_files/clef_task_#{@clef_task.id}/#{SecureRandom.uuid}_${filename}",
                                               success_action_status: '201',
                                               acl: 'private')
  end

end
