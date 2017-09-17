class RenameMailer < ActiveRecord::Migration[5.0]
  def change
    rename_column :emails, :mailer, :mailer_classname
    rename_column :mailers, :mailer, :mailer_classname
  end
end
