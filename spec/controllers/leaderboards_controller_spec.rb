require 'rails_helper'

RSpec.describe LeaderboardsController, type: :controller do

  it { should route(:get, '/challenges/1/leaderboards').to('leaderboards#index', {:challenge_id=>"1"}) }

  it { should use_before_filter(:authenticate_participant!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_leaderboard) }
  it { should use_before_filter(:set_challenge) }

end
