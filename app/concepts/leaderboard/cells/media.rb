class Leaderboard::Cell::Media < Template::Cell
  inherit_views Leaderboard::Cell

  def show
    render :media
  end

  def leaderboard_row
    model
  end

  def size
    options[:size]
  end

  def dimensions
    if size == :thumb
      return "125x125"
    else
      return "500x500"
    end
  end

  def content_type
    return nil if leaderboard_row.media_content_type.nil?

    content_type = leaderboard_row.media_content_type.split('/').first
    content_type = nil if ['video','image'].exclude?(content_type)
    return content_type
  end

  def media_asset
    case content_type
    when nil
      return image_tag(default_image_url, size: dimensions)
    when 'video'
      return video
    when 'image'
      return image
    end
  end

  def image
    if expiring_url.present?
      return image_tag(expiring_url, size: dimensions)
    else
      return image_tag(default_image_url, size: dimensions)
    end
  end

  def video
    if expiring_url.present?
      return video_tag(expiring_url, size: dimensions)
    else
      return image_tag(default_image_url, size: dimensions)
    end
  end

  def expiring_url
    if size == :thumb
      url = S3Service.new(leaderboard_row.media_thumbnail).expiring_url
    else
      url = S3Service.new(leaderboard_row.media_large).expiring_url
    end
  end

  def audio
    # TODO requirements to be defined
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
