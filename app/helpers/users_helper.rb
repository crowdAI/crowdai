module UsersHelper
  # TODO refactor image attachments
  def avatar_medium_url(user)
    if user.avatar
      user.avatar.url(:medium)
    else
      'http://www.gravatar.com/avatar/?d=mm&s=200'
    end
  end


  def avatar_url(user, size)
    if user.avatar
      if size == 'profile'
        user.avatar.url('thumbnail')
      else
        user.avatar.url(size)
      end
    else
      'http://www.gravatar.com/avatar/?d=mm&s=200'
    end
  end
  # usage:  <%= image_tag avatar_url(user,'medium'), class: "img-responsive" %>
  #         <%= image_tag avatar_url(user,'thumbnail') %>
end
