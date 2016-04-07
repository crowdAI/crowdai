module DownloadsHelper

  def download_url(file)
    challenge = Challenge.find(file.challenge_id)

    if current_participant.admin? || current_participant.organizer_id = challenge.organizer_id
      out = capture { link_to file_info(file), file.dataset_file.url }
      out << capture { link_to content_tag(:i, nil, class: 'fa fa-trash-o pull-right'),
                       [challenge,file],
                       method: :delete,
                       data: { confirm: 'Are you sure?' } }
    else
      out = capture { link_to file_info(file), file.dataset_file.expiring_url }
    end
    out
  end
  
end
