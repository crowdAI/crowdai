module ImagesHelper

  def image_medium_url(challenge)
    if challenge.image
      challenge.image.image.url(:medium)
    else
      image_path default_image_url
    end
  end

  def image_url(model)
    if model.image_file
      image_url = model.image_file.url
      if image_url.nil?
        image_url = default_image_url
      end
    else
      image_url = default_image_url
    end
  end

  def default_image_url
    image_path 'users/avatar-default.png'
  end

end
