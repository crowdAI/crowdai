require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

  let(:valid_attributes) {
    { name: 'William',
      email: 'will@example.com',
      password: 'password12',
      password_confirmation: 'password12'
    }
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:participant, organizer_id: 'abcd').attributes
  }

  let(:valid_session) { {} }

  before(:each) do
    double_sign_in
  end

  describe "GET #show" do
    it "assigns the requested participant as @participant" do
      participant = Participant.create! valid_attributes
      get :show, {:id => participant.to_param}, valid_session
      expect(assigns(:participant)).to eq(participant)
    end
  end


  describe "GET #edit" do
    it "assigns the requested participant as @participant" do
      participant = Participant.create! valid_attributes
      get :edit, {:id => participant.to_param}, valid_session
      expect(assigns(:participant)).to eq(participant)
    end
  end

=begin
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Sean 3", city: 'Athens'}
      }

      it "updates the requested participant" do
        participant = Participant.create! valid_attributes
        put :update, {:id => participant.to_param, :participant => new_attributes}, valid_session
        participant.reload
        new_attributes.each_pair do |key, value|
          expect(participant[key]).to eq(value)
        end
      end

      it "assigns the requested participant as @participant" do
        participant = Participant.create! valid_attributes
        put :update, {:id => participant.to_param, :participant => valid_attributes}, valid_session
        expect(assigns(:participant)).to eq(participant)
      end

      it "redirects to the participant" do
        participant = Participant.create! valid_attributes
        put :update, {:id => participant.to_param, :participant => valid_attributes}, valid_session
        expect(response).to redirect_to(participant)
      end
    end

    context "with invalid params" do
      it "assigns the participant as @participant" do
        participant = Participant.create! valid_attributes
        put :update, {:id => participant.to_param, :participant => invalid_attributes}, valid_session
        expect(assigns(:participant)).to eq(participant)
      end

      it "re-renders the 'edit' template" do
        participant = Participant.create! valid_attributes
        put :update, {:id => participant.to_param, :participant => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end
=end TODO

=begin TODO
  describe "DELETE #destroy" do
    it "destroys the requested participant" do
      participant = Participant.create! valid_attributes
      expect {
        delete :destroy, {:id => participant.to_param}, valid_session
      }.to change(participant, :count).by(-1)
    end

    it "redirects to the participants list" do
      participant = Participant.create! valid_attributes
      delete :destroy, {:id => participant.to_param}, valid_session
      expect(response).to redirect_to(participants_url)
    end
  end
=end

  it { should route(:patch, '/participants/1').to('participants#update', {:id=>"1"}) }
  it { should route(:get, '/participants/1').to('participants#show', {:id=>"1"}) }

  it { should use_before_filter(:authenticate_participant!) }
  it { should use_before_filter(:set_participant) }


end
