module Profile
  class PostsController < ProfileController
    before_action :set_participant, :set_stats
  end
end
