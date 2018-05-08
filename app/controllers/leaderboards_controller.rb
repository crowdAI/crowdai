class LeaderboardsController < ApplicationController
  before_action :authenticate_participant!,
    except: [:index, :video_modal]
  before_action :set_challenge
  respond_to :js, :html
  layout :set_layout

  def index
    @current_round = current_round
    if @challenge.completed?
      if params[:post_challenge] == 'on'
        @post_challenge = 'on'
      else
        @post_challenge = 'off'
      end
    end
    if @current_round.blank?
      current_round_id = 0
    else
      current_round_id = @current_round.id
    end
    if @post_challenge == 'on'
      @leaderboards = policy_scope(OngoingLeaderboard)
          .where(challenge_round_id: current_round_id)
          .page(params[:page])
          .per(10)
    else
      @leaderboards = policy_scope(Leaderboard)
          .where(challenge_round_id: current_round_id)
          .page(params[:page])
          .per(10)
    end
  end

  def submission_detail
    leaderboard = Leaderboard.find(params[:leaderboard_id])
    @leaderboard = @challenge.leaderboards
    @submissions = Submission
      .where(
        participant_id: params[:participant_id],
        challenge_id: params[:challenge_id],
        challenge_round_id: leaderboard.challenge_round_id)
      .order(created_at: :desc)
    render js: concept(
      Leaderboard::Cell,
      @leaderboard,
      challenge: @challenge,
      submissions: @submissions).(:insert_submissions)
  end

  private
  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end

  def current_round
    if params[:challenge_round_id].present?
      ChallengeRound.find(params[:challenge_round_id].to_i)
    else
      @challenge.challenge_rounds.where(active: true).first
    end
  end

  def set_layout
    return 'bare' if action_name == 'show'
    return 'application'
  end

end
