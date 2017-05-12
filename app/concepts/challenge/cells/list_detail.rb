class Challenge::Cell::ListDetail < Template::Cell
  inherit_views Challenge::Cell

  def show
    render :list_detail
  end

  private
  def challenge
    model
  end

end
