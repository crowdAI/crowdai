class Challenge::Cell::ListDetail < Cell::Concept
  inherit_views Challenge::Cell


  def show
    render :list_detail
  end

  private
  def challenge
    model
  end

end
