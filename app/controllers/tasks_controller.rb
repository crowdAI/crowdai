class TasksController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_organizer
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = @organizer.tasks
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
      redirect_to [@organizer,@task], notice: 'task was successfully updated.'
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
                  task_dataset_file_params: [
                    :id, :_destroy, :title, :dataset_file_s3_key
                  ])
  end

end
