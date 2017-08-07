require 'rails_helper'

RSpec.describe FollowsController, type: :controller do

  let!(:challenge) { create :challenge, :running }
  let!(:participant) { create :participant }

  context 'participant' do
    before do
      sign_in participant
    end

    describe "Follow a Challenge" do
      def follow
        post :create, challenge_id: challenge.id
        challenge.reload
      end
      it { expect { follow }.to change { Follow.count }.by(1) }
      it { expect { follow }.to change { challenge.follows.count }.by(1) }
      it { expect { follow }.to change { participant.follows.count }.by(1) }
    end

    #describe "Unfollow a Challenge" do
    #  def unfollow
    #    delete :destroy, params: { challenge_id: challenge.id }
    #    challenge.reload
    #  end
    #  it { expect { unfollow }.to change { Follow.count }.by(-1) }
    #  it { expect { unfollow }.to change { challenge.follows.count }.by(1) }
    #  it { expect { unfollow }.to change { participant.follows.count }.by(1) }
    #end
  end

end
