class Dataset::Cell::ListDetail < Template::Cell
  inherit_views Dataset::Cell

  def show
    render :list_detail
  end

  def dataset_file
    model
  end

  def file_size
    number_to_human_size(dataset_file.dataset_file.size)
  end

  def file_type
    dataset_file.dataset_file.file.extension.upcase
  end

  def expiring_url
    dataset_file.dataset_file.file.public_url
  end

end
