class Challenge::Cell::List < Template::Cell
  inherit_views Challenge::Cell

  def show
    render :list
  end

  def append
    %{ $('#load-more').replaceWith("#{j(show)}") }
  end

  private

  def challenges
    @challenges ||= model.page(page).per(2)
  end

  def page
    options[:page] or 1
  end

end
