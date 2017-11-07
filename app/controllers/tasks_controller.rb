class TasksController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_organizer
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :create, :edit]

  def index
    @tasks = @organizer.tasks
    @challenges = @organizer.challenges
  end

  def new
    @task = @organizer.tasks.new
  end

  def edit
    authorize @task
  end

  def create
    @task = @organizer.tasks.new(task_params)
    authorize @task

    if @task.save
      redirect_to organizer_tasks_path(@organizer)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to organizer_tasks_path(@organizer)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to organizer_tasks_path(@organizer)
  end

  private
  def set_organizer
    @organizer = Organizer.friendly.find(params[:organizer_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task)
          .permit(:task,
                  task_dataset_files_attributes: [
                    :id, :_destroy, :title, :dataset_file_s3_key
                  ])
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "task_dataset_files/organizer_#{@organizer.id}/#{SecureRandom.uuid}_${filename}",
                                               success_action_status: '201',
                                               acl: 'private')
  end

end
