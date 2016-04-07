
module ChallengesHelper

  def image_medium_url(challenge)
    if challenge.image
      challenge.image.image.url(:medium)
    else
      image_path 'PV_avatar_medium.png'
    end
  end


end
