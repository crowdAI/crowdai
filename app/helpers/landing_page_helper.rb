module LandingPageHelper

  def users_group(index)
    if index < 4
      return "users-group-1"
    else
      return "users-group-#{index - 2}"
    end
  end

end
