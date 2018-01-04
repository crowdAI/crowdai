module Mentions

  def mentions(fieldname)
    if eval(fieldname)
      regex = /@([\w]+)/
      matches = eval("#{fieldname}.scan(regex).flatten")
    else
      []
    end
  end

  def mentioned_participants
    Participant.where(name: mentioned_names)
  end

  def valid_participants
    Participant.all.pluck(:name).join('|')
  end

  def linked_users(body)
    body.gsub /@(valid_participants)/ do |match|
      link_to match, participants_path($1)
    end
    return body
  end

end
