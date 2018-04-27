module LandingPageHelper

  def users_group(index)
    if index <= 3
      return "users-group-1"
    else
      return "users-group-#{index + 1}"
    end
  end
  
end
