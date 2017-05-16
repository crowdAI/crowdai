class Dataset::Cell::ListDetail < Template::Cell
  inherit_views Dataset::Cell

  def show
    render :list_detail
  end

  def dataset_file
    model
  end

end
