module DownloadsHelper

  def download_url(file)
    competition = Competition.find(file.competition_id)

    if current_user.admin? || current_user.hosting_institution_id = competition.hosting_institution_id
      out = capture { link_to file_info(file), file.dataset_file.url }
      out << capture { link_to content_tag(:i, nil, class: 'fa fa-trash-o pull-right'),
                       [competition,file],
                       method: :delete,
                       data: { confirm: 'Are you sure?' } }
    else
      out = capture { link_to file_info(file), file.dataset_file.expiring_url }
    end
    out
  end
  
end
