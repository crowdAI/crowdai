module Profile
  class ProfileController < ApplicationController

    def index
    end

    def set_participant
      @participant = Participant.friendly.find(params[:participant_id])
      authorize [:profile, @participant]
    end

    def set_stats
      @achievements = achievements
      @articles = articles
      @challenges = challenges
      @posts = posts
      @badge_stats = BadgeStat.all
    end

    def achievements
      @participant.badges
    end

    def articles
      Article.where(participant_id: @participant.id)
    end

    def challenges
      challenge_ids = policy_scope(ParticipantChallenge)
        .where(participant_id: @participant.id)
        .pluck(:challenge_id)
      Challenge.where(id: challenge_ids)
    end

    def posts
      @participant.comments.order(created_at: :desc)
    end
  end
end
