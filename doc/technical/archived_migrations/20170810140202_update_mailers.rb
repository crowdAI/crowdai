class UpdateMailers < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER SEQUENCE mailers_id_seq RESTART with 10;"
    CrowdaiMailer.create!(mailer_classname: 'Admin::OrganizerApplicationNotificationMailer')
    CrowdaiMailer.create!(mailer_classname: 'Admin::SubmissionNotificationMailer')
    CrowdaiMailer.create!(mailer_classname: 'CommentNotificationMailer')
    CrowdaiMailer.create!(mailer_classname: 'EmailDigestMailer')
    CrowdaiMailer.create!(mailer_classname: 'OrganizerApplicationNotificationMailer')
  end
end
