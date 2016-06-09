class AddAccountValidToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :account_disabled, :boolean, default: false
    add_column :participants, :account_disabled_reason, :text
    add_column :participants, :account_disabled_dttm, :datetime
  end
end
