class Challenge::Cell::ChallengeSubnav < Template::Cell
  inherit_views Challenge::Cell

  def show
    render :challenge_subnav
  end

  def challenge
    model
  end

  def current_tab
    options[:tab] ||= 'overview'
  end

  def tab_class(tab)
    if tab == current_tab
      return "class='active'"
    else
      return nil
    end
  end

end
