class Dataset::Cell::List < Template::Cell
  inherit_views Dataset::Cell

  def show
    render :list
  end

  def dataset_files
    model
  end

end
