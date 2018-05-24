class GdprExportMailer < ApplicationMailer

  def sendmail(participant_id:)
    participant = Participant.find(participant_id)
    subject = "[crowdAI] Personal Data download"
    csv_file = encoded_attachment(participant_id: participant_id)

    options = format_options(
      participant: participant,
      body: email_body,
      csv_file: csv_file
    )
    mandrill_send(options)
  end

  def encoded_attachment(participant_id:)
    Base64.encode64(GdprExporter.export(participant_id))
  end

  def email_body
    %Q[
      <div>
        <h3>Your requested crowdAI data</h3>
        <p>
          A request was made to download your personal data stored on crowdAI. This data is attached to this email.
        </p>
        <p>
          Should you wish to delete your data, deleting your crowdAI account will also remove all personal data contained in the attached file.
        </p>
        <br/>
      </div>
    ]
  end

  def format_options(participant:,body:,csv_file:)
    options = {
      participant_id:   participant.id,
      subject:          "[crowdAI] Personal Data download",
      to:               participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           'NAME',
          content:        "#{participant.name}"
        },
        {
          name:           'BODY',
          content:        body
        },
        {
          name:           'EMAIL_PREFERENCES_LINK',
          content:        " "
        }
      ],
      attachments: [
        {
          type: "file/csv",
          name: "crowdai_data.csv",
          content: csv_file
        }
      ]
    }
  end

end
