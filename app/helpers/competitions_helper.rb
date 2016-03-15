
module CompetitionsHelper

  def image_medium_url(competition)
    if competition.image
      competition.image.image.url(:medium)
    else
      image_path 'PV_avatar_medium.png'
    end
  end
end
