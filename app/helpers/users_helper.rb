module UsersHelper
  def avatar_medium_url(user)
    if user.avatar
      user.avatar.url(:medium)
    else
      image_path 'PV_avatar_medium.png'
    end
  end
end
