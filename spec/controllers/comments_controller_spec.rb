require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST #create" do
    context "with valid params" do
      it "creates a new OrganizersController" do
        expect {
          post :create, params: {organizers_controller: valid_attributes}, session: valid_session
        }.to change(OrganizersController, :count).by(1)
      end
    end
  end

end
