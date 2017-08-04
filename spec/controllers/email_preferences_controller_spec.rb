require 'rails_helper'
RSpec.describe EmailPreferencesController, type: :controller do

  let(:participant) { create :participant }
  let(:email_preference) { participant.email_preferences.first }

  describe "GET #edit" do
    it "assigns the requested email_preference as @email_preference" do
      get :edit, params: { participant_id: participant.id, id: email_preference.id }
      puts assigns.inspect
      expect(assigns(:email_preference)).to eq(email_preference)
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { my_leaderboard: true, any_leaderboard: false }
    }

    it "updates the requested email_preference" do
      put :update, params: { participant_id: participant.id, id: email_preference.id, email_preference: new_attributes}
      email_preference.reload
      expect(email_preference.my_leaderboard).to eq(new_attributes[:my_leaderboard])
      expect(email_preference.any_leaderboard).to eq(new_attributes[:any_leaderboard])
    end

    it "assigns the requested email_preference as @email_preference" do
      put :update, params: { participant_id: participant.id, id: email_preference.id, email_preference: new_attributes}
      expect(assigns(:email_preference)).to eq(email_preference)
    end

    it "redirects to the email_preferences_controller" do
      put :update, params: { participant_id: participant.id, id: email_preference.id, email_preference: new_attributes}
      expect(response).to redirect_to([participant,email_preference])
    end
  end
end
