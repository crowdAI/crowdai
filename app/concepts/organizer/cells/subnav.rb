class Organizer::Cell::Subnav < Template::Cell
  inherit_views Organizer::Cell

  def show
    render :subnav
  end

  def organizer
    model
  end

  def current_tab
    options[:tab] ||= 'challenges'
  end

  def tab_class(tab)
    if tab == current_tab
      return "class='active'"
    else
      return nil
    end
  end

end
