class SqlView < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = :id
  after_initialize :readonly!
end


# To see view text in the DB
# SELECT *
# FROM   information_schema.VIEWS
# WHERE  table_name = 'leaderboards';
