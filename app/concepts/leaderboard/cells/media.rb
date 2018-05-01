class Leaderboard::Cell::Media < Leaderboard::Cell

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
      return "100x75"
    end
    if size == :large
      return "800x600"
    end
  end

  def content_type
    return nil if leaderboard_row.media_content_type.nil?

    content_type = leaderboard_row.media_content_type.split('/').first
    content_type = nil if ['video','image','youtube'].exclude?(content_type)
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
    when 'youtube'
      return youtube
    end
  end

  def image
    if public_url.present?
      return image_tag(public_url, size: dimensions)
    else
      return image_tag(default_image_url, size: dimensions)
    end
  end

  def video
    if public_url.present?
      return video_tag(public_url, size: dimensions)
    else
      return video_tag(default_image_url, size: dimensions)
    end
  end

  def youtube
    result = %(<iframe title="YouTube video player" width="800"
                height="600" src="//www.youtube.com/embed/#{ leaderboard_row.media_large }"
                frameborder="0" allowfullscreen></iframe>)
    return result.html_safe
  end

  def public_url
    if size == :large
      url = S3Service.new(leaderboard_row.media_large).public_url
    else
      url = S3Service.new(leaderboard_row.media_thumbnail).public_url
    end
  end

  def audio
    # TODO requirements to be defined
  end

  def default_image_url
    image_path 'users/avatar-default.png'
  end

end
