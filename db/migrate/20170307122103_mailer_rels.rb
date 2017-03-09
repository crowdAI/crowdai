class MailerRels < ActiveRecord::Migration[5.0]
  def change
    execute "UPDATE mailers SET mailer = 'PostNotificationMailer' WHERE id = 3;"
    execute "UPDATE emails  SET mailer_id = (SELECT m.id FROM mailers m WHERE m.mailer = emails.mailer)
;"
  end
end
