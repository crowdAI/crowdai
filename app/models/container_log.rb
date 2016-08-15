class ContainerLog < ActiveRecord::Base
  belongs_to :docker_container

  as_enum :log_level, [:info, :error]
end
