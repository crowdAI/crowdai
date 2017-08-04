  require 'rails_helper'

RSpec.describe OrganizersController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:organizer)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:organizer,:invalid)
  }

  context 'as an admin' do
    let(:participant) { create :participant, :admin }
    let(:organizer) { create :organizer }

    before do
      sign_in participant
    end

    describe "GET #show" do
      it "assigns the requested organizer as @organizer" do
        get :show, params: {id: organizer.id }
        expect(assigns(:organizer)).to eq(organizer)
      end
    end

    describe "GET #edit" do
      it "assigns the requested organizer as @organizer" do
        get :edit, params: { id: organizer.id }
        expect(assigns(:organizer)).to eq(organizer)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Organizer" do
          expect {
            post :create, params: { organizer: valid_attributes }
          }.to change(Organizer, :count).by(1)
        end

        it "assigns a newly created organizer as @organizer" do
          post :create, params: { organizer: valid_attributes }
          expect(assigns(:organizer)).to be_a(Organizer)
          expect(assigns(:organizer)).to be_persisted
        end

        it "redirects to the created organizer" do
          post :create, params: { organizer: valid_attributes }
          expect(response).to redirect_to(Organizer.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved organizer as @organizer" do
          post :create, params: { organizer: invalid_attributes }
          expect(assigns(:organizer)).to be_a_new(Organizer)
        end

        it "re-renders the 'new' template" do
          post :create, params: { organizer: invalid_attributes }
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { organizer: 'new name', description: 'some new description' }
        }

        it "updates the requested organizer" do
          put :update, params: { id: organizer.id, organizer: new_attributes }
          organizer.reload
          expect(organizer.organizer).to eq(new_attributes[:organizer])
          expect(organizer.description).to eq(new_attributes[:description])
        end

        it "assigns the requested organizer as @organizer" do
          put :update, params: { id: organizer.id, organizer: valid_attributes }
          expect(assigns(:organizer)).to eq(organizer)
        end

        it "redirects to the organizer" do
          put :update, params: { id: organizer.to_param, organizer: valid_attributes }
          expect(response).to redirect_to(organizer)
        end
      end

      context "with invalid params" do
        it "assigns the organizer as @organizer" do
          put :update, params: { id: organizer.id, organizer: invalid_attributes}
          expect(assigns(:organizer)).to eq(organizer)
        end

        it "re-renders the 'edit' template" do
          put :update, params: { id: organizer.id, organizer: invalid_attributes }
          expect(response).to render_template("edit")
        end
      end
    end

    #describe "DELETE #destroy" do
    #  it "destroys the requested organizer" do
    #    expect {
    #      delete :destroy, params: { id: organizer.id }
    #    }.to change(Organizer, :count).by(-1)
    #  end
    #
    #  it "redirects to the organizers list" do
    #    delete :destroy, params: { id: organizer.id }
    #    expect(response).to redirect_to('/')
    #  end
    #end
  end

end
