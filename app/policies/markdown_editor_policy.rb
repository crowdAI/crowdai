class MarkdownEditorPolicy < ApplicationPolicy

  def index?
    participant
  end

  def presign?
    participant
  end

end
