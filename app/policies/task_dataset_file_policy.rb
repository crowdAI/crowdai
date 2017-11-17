class TaskDatasetFilePolicy < DatasetFilePolicy

  def index?
    participant
  end

  def new?
    participant && (participant.admin? || @record.clef_task.organizer_id == participant.organizer_id)
  end

  def create?
    new?
  end

  def destroy?
    new?
  end

end
