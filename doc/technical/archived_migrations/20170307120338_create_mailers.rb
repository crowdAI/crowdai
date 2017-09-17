class CreateMailers < ActiveRecord::Migration[5.0]
  def change
    create_table :mailers do |t|
      t.string :mailer
      t.boolean :paused, default: false

      t.timestamps
    end
  end
end
