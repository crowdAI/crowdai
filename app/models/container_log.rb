class ContainerLog < ActiveRecord::Base
  belongs_to :container_instance

  as_enum :log_level, [:info, :error], map: :string
  as_enum :log_source, [:server, :container], map: :string

  default_scope { order('id DESC') }

  validates :container_instance_id,    presence: true
  validates :log_level,                presence: true
  validates :log_source,               presence: true
end
