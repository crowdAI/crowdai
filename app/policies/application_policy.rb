class ApplicationPolicy
  attr_reader :participant, :record

  def initialize(participant, record)
    @participant = participant
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    false
  end

  def edit?
    false
  end

  def destroy?
    false
  end

end
