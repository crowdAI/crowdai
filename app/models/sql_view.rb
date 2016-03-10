class SqlView < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = :id
  after_initialize :readonly!
end
