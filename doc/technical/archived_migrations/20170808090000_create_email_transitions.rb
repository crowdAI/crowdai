class CreateEmailTransitions < ActiveRecord::Migration
  def change
    create_table :email_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :email_id, null: false
      t.boolean :most_recent, null: false
      t.timestamps null: false
    end

    add_index(:email_transitions,
              [:email_id, :sort_key],
              unique: true,
              name: "index_email_transitions_parent_sort")
    add_index(:email_transitions,
              [:email_id, :most_recent],
              unique: true,
              where: 'most_recent',
              name: "index_email_transitions_parent_most_recent")

    add_column :emails, :state, :string
    execute "update emails set state = 'mandrill_sent' where status_cd = 'sent';"
    remove_column :emails, :status_cd
  end
end
