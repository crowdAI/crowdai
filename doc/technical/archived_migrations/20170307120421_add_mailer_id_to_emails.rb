class AddMailerIdToEmails < ActiveRecord::Migration[5.0]
  def change
    add_reference :emails, :mailer, foreign_key: true
    CrowdaiMailer.create!(id: 1, mailer: 'DeviseMandrillMailer')
    CrowdaiMailer.create!(id: 2, mailer: 'LeaderboardNotificationMailer')
    CrowdaiMailer.create!(id: 3, mailer: 'PostNotifictionMailer')
    CrowdaiMailer.create!(id: 4, mailer: 'SubmissionGradedNotificationMailer')
    CrowdaiMailer.create!(id: 5, mailer: 'SubmissionNotificationMailer')
  end
end
