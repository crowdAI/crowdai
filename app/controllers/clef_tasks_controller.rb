class ClefTasksController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_organizer
  before_action :set_clef_task, only: [:edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :create, :edit]

  def index
    @clef_tasks = @organizer.clef_tasks
    @challenges = @organizer.challenges
  end

  def new
    @clef_task = @organizer.clef_tasks.new
  end

  def edit
    authorize @clef_task
  end

  def create
    @clef_task = @organizer.clef_tasks.new(clef_task_params)
    authorize @clef_task

    if @clef_task.save
      redirect_to organizer_clef_tasks_path(@organizer)
    else
      render :new
    end
  end

  def update
    if @clef_task.update(clef_task_params)
      redirect_to organizer_clef_tasks_path(@organizer)
    else
      render :edit
    end
  end

  def destroy
    @clef_task.destroy
    redirect_to organizer_clef_tasks_path(@organizer)
  end

  private
  def set_organizer
    @organizer = Organizer.friendly.find(params[:organizer_id])
  end

  def set_clef_task
    @clef_task = ClefTask.find(params[:id])
  end

  def clef_task_params
    params.require(:clef_task)
          .permit(:task,
                  :eua_file,
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
