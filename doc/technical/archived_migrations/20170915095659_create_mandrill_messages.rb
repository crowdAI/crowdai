class CreateMandrillMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :mandrill_messages do |t|
      t.jsonb :res
      t.jsonb :message
      t.jsonb :meta

      t.timestamps
    end
  end
end
