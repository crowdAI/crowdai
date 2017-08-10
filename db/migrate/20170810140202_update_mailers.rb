class UpdateMailers < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER SEQUENCE mailers_id_seq RESTART with 10;"
    Mailer.create!(mailer_classname: 'Admin::OrganizerApplicationNotificationMailer')
    Mailer.create!(mailer_classname: 'Admin::SubmissionNotificationMailer')
    Mailer.create!(mailer_classname: 'CommentNotificationMailer')
    Mailer.create!(mailer_classname: 'EmailDigestMailer')
    Mailer.create!(mailer_classname: 'OrganizerApplicationNotificationMailer')
  end
end
