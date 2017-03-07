class AddMailerIdToEmails < ActiveRecord::Migration[5.0]
  def change
    add_reference :emails, :mailer, foreign_key: true
    Mailer.create!(id: 1, mailer: 'DeviseMandrillMailer')
    Mailer.create!(id: 2, mailer: 'LeaderboardNotificationMailer')
    Mailer.create!(id: 3, mailer: 'PostNotifictionMailer')
    Mailer.create!(id: 4, mailer: 'SubmissionGradedNotificationMailer')
    Mailer.create!(id: 5, mailer: 'SubmissionNotificationMailer')
  end
end
