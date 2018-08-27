class NullMigration < ActiveRecord::Migration[5.2]
  def up
    # noop

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
