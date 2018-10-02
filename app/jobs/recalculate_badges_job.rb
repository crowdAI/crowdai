class RecalculateBadgesJob < ApplicationJob
  queue_as :default

  def perform(reset_log: false)
    Participant.update_all(sash_id: nil)
    Merit::BadgesSash.delete_all
    Merit::Sash.delete_all
    Merit::Score::Point.delete_all

    # 1. Conditionally reset activity log
    if reset_log
      Merit::ActivityLog.delete_all
    end

    # 2. Mark all `merit_actions` as unprocessed
    Merit::Action.all.map{|a| a.update_attribute :processed, false }

    # 3. Recompute reputation rules
    Merit::Action.check_unprocessed
    Merit::RankRules.new.check_rank_rules
  end
end
