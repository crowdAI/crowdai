module ParticipantsHelper
  # TODO refactor image attachments
  def avatar_medium_url(participant)
    if participant.avatar
      participant.avatar.url(:medium)
    else
      'http://www.gravatar.com/avatar/?d=mm&s=200'
    end
  end


  def avatar_url(participant, size)
    if participant.avatar
      if size == 'profile'
        participant.avatar.url('thumbnail')
      else
        participant.avatar.url(size)
      end
    else
      'http://www.gravatar.com/avatar/?d=mm&s=200'
    end
  end
  # usage:  <%= image_tag avatar_url(user,'medium'), class: "img-responsive" %>
  #         <%= image_tag avatar_url(user,'thumbnail') %>
end
