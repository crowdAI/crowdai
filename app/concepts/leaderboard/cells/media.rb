class Leaderboard::Cell::Media < Template::Cell
  inherit_views Leaderboard::Cell

  def show
    render :media
  end

  def leaderboard
    model
  end

  def size
    options[:size]
  end

  def media_type
    'image'
  end

  def image
    if 1 == 2
      image_url = model.image.image.url(size)
      if Faraday.head(image_url).status != 200
        image_url = default_image_url
      end
    else
      image_url = default_image_url
    end
    image_tag image_url
  end

  def video
  end

  def audio
  end

  def default_image_url
    image_path 'users/avatar-default.png'
  end



  #options
  #  - image
  #  - video
  #  - size (thumb, sm, m, l)
  #
  # fallback to default image if missing
  # Option to popup modal to large image
end
