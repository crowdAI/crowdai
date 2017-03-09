if Rails.env == 'test'
  Mailer.create!(mailer: 'DeviseMandrillMailer')
  Mailer.create!(mailer: 'LeaderboardNotificationMailer')
  Mailer.create!(mailer: 'PostNotifictionMailer')
  Mailer.create!(mailer: 'SubmissionGradedNotificationMailer')
  Mailer.create!(mailer: 'SubmissionNotificationMailer')
end
