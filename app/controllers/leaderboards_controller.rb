class LeaderboardsController < ApplicationController
  before_action :authenticate_participant!,
    except: [:index, :show, :video_modal]
  before_action :set_leaderboard,
    only: [:show]
  before_action :set_challenge
  respond_to :js, :html
  layout :set_layout

  def show
    @participant = @entry.participant
    @submission = Submission.find(@entry.submission_id)
    @grader_logs = grader_logs
  end

  def index
    if @challenge.show_leaderboard == false
      redirect_to '/'
    end
    @current_round = current_round
    if @challenge.completed?
      if params[:post_challenge] == 'on'
        @post_challenge = 'on'
      else
        @post_challenge = 'off'
      end
    end
    if @post_challenge == 'on'
      @leaderboards = @challenge
        .ongoing_leaderboards
        .where(challenge_round_id: current_round.id)
        .page(params[:page])
        .per(10)
    else
      @leaderboards = @challenge
        .leaderboards
        .where(challenge_round_id: current_round.id)
        .page(params[:page])
        .per(10)
    end

    if current_participant && (current_participant.admin? || @challenge.organizer_id == current_participant.organizer_id)
      @participant_submissions = ParticipantSubmission.where(challenge_id: @challenge.id)
    end
  end

  def video_modal
    @leaderboard = Leaderboard.where(submission_id: params[:submission_id]).first
    respond_to do |format|
      format.html { redirect_to challenge_leaderboards_path(@challenge) }
      format.js { render 'leaderboards/ajax/video_modal' }
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
  def set_leaderboard
    @entry = Leaderboard.where(submission_id: params[:id]).first
  end

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

  def grader_logs
    if @challenge.grader_logs
      s3_key = "grader_logs/#{@challenge.slug}/grader_logs_submission_#{@submission.id}.txt"
      s3 = S3Service.new(s3_key)
      @grader_logs = s3.filestream
    end
    return @grader_logs
  end

end
