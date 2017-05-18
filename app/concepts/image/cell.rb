class Image::Cell < Template::Cell

  def show
    render
  end

  def size
    options[:size] ||= :medium
  end

  def image
    if model.image_file
      image_url = model.image_file.url(size)
      if image_url.nil? || Faraday.head(image_url).status != 200
        image_url = default_image_url
      end
    else
      image_url = default_image_url
    end
    image_tag(image_url)
  end

  def default_image_url
    image_path 'users/avatar-default.png'
  end


end
