class DynamicContent::Cell < Template::Cell

  def show
    render :dynamic_content
  end

  def challenge
    model
  end

  def dynamic_content
    challenge.dynamic_content
  end

end
