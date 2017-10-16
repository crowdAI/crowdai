module SqlView
  def included(base)
    base.module_eval do
      self.primary_key = :id
      after_initialize :readonly!
    end
  end
end


# To see view text in the DB
# SELECT *
# FROM   information_schema.VIEWS
# WHERE  table_name = 'leaderboards';
