class Discussion::Cell::List < Template::Cell
  inherit_views Discussion::Cell

  def show
    render :list
  end

  def topics
    model
  end

end
