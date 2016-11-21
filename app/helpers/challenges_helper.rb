module ChallengesHelper

  def version_link(challenge)
    if challenge.versions.any?
      html = <<-HTML
        <div class='pull-right'>
          #{pluralize(challenge.versions.count, ' previous version')}
        </div>
      HTML
    else
      html = <<-HTML
        <div class='pull-right'>No previous versions</div>
      HTML
    end
    html.html_safe
  end

  def version_stats(params,challenge)
    version = challenge.versions[params[:version].to_i]
    participant = Participant.find(version.whodunnit)
    modified_dttm = display_dttm(version.created_at)
    #link_to participant.name, participant_path(participant)

    "<span>Modified by #{link_to participant.name, participant_path(participant)}
            on #{modified_dttm}</span>".html_safe
  end



  def prev_version(params,challenge)
    if params[:version]
      params[:version].to_i - 1
    else
      -1
    end
  end

  def next_version(params)
    params[:version].to_i + 1
  end

end
