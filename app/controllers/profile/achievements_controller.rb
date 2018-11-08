module Profile
  class AchievementsController < ProfileController
    before_action :set_participant, :set_stats

    def index
      @achievements = @participant.badges
      @unachieved = Merit::Badge.all.to_a - @participant.badges
    end

    def set_participant
      @participant = Participant.friendly.find(params[:id])
      authorize [:profile, @participant]
    end
  end
end
