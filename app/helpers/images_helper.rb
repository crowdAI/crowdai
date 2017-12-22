module ImagesHelper

  def image_medium_url(challenge)
    if challenge.image
      challenge.image.image.url(:medium)
    else
      image_path 'image_not_found.png'
    end
  end

  def image_url(model,size)
    if model.image
      model.image.image.url(size)
    else
      image_path 'image_not_found.png'
    end
  end

end
