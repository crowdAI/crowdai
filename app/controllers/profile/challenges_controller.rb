module Profile
  class ChallengesController < ProfileController
    before_action :set_participant, :set_stats
  end
end
