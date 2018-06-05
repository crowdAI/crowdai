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
    Base64.encode64(build_csv(participant_id: participant_id))
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

  def build_csv(participant_id:)
    CSV.generate(force_quotes: true) do |csv|
      GDPR_FIELDS.each do |rec|
        csv << [rec[:table]]
        rows(rec: rec,participant_id: participant_id).each do |row|
          csv << row
        end
      end
    end
  end

  def rows(rec:,participant_id:)
    query = "#{query(rec: rec, participant_id: participant_id)}.pluck('#{plucked(rec: rec)}')"
    eval(query)
  end

  def query(rec:,participant_id:)
    "#{rec[:table]}.where(#{rec[:id_field]}: #{participant_id})"
  end

  def plucked(rec:)
    rec[:fields].join(',')
  end

end
