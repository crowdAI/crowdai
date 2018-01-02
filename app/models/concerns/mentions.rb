module Mentions

  def mentions
    @mentions ||= begin
                    regex = /@([\w]+)/
                    body.scan(regex).flatten
                  end
   end

  def mentioned_participants
    Participant.where(name: mentions)
  end

  def linked_users(body)
    body.gsub /@([\w]+)/ do |match|
      link_to match, participants_path($1)
    end
  end
  
end
