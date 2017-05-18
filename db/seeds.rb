if Rails.env == 'test'
  Mailer.create!(mailer_classname: 'DeviseMandrill')
  Mailer.create!(mailer_classname: 'LeaderboardNotification')
  Mailer.create!(mailer_classname: 'PostNotifiction')
  Mailer.create!(mailer_classname: 'SubmissionGradedNotification')
  Mailer.create!(mailer_classname: 'SubmissionNotification')
end
