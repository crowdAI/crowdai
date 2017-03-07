class AddOptionsJsonToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :options_json, :jsonb
    emails = Email.all
    emails.each do |e|
      e.options_json = eval(e.options).deep_stringify_keys
      e.save
    end
  end
end
