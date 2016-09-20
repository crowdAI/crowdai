class AddSubmissionIdToContainerInstances < ActiveRecord::Migration
  def change
    add_reference :container_instances, :submission, index: true, foreign_key: true
  end
end
