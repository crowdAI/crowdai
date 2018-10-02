module Profile
  class BioController < ProfileController
    before_action :set_participant, :set_stats
  end
end
