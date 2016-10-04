require 'rails_helper'

RSpec.describe OrganizersController, type: :controller do
  let!(:organizer) { create :organizer }
  let!(:other_organizer) { create :organizer, organizer: 'other' }
  let!(:admin) { create :participant, :admin }

  context 'admin user' do
    before { sign_in admin }

=begin
    describe 'GET #index' do
      before { get :index }
      it "assigns all organizers" do
        expect(assigns(:organizers)).to eq([organizer,other_organizer])
      end
      it { expect(response).to render_template :index }
    end
=end

    describe 'GET #show' do
      before { get :show, id: other_organizer.to_param }
      it "assigns for an organizer" do
        expect(assigns(:organizer)).to eq(other_organizer)
      end
      it { expect(response).to render_template :show }
    end

    describe 'GET #new' do
      before { get :new }
      it "assigns @organizer" do
        expect(assigns(:organizer)).to be_a_new(Organizer)
      end
      it { expect(response).to render_template :new }
    end

    describe 'GET #edit' do
      before { get :edit, id: organizer.to_param }
      it "assigns for the admin organizer" do
        expect(assigns(:organizer)).to eq(organizer)
      end
      it { expect(response).to render_template :edit }
    end


    describe 'POST #create' do
      context 'with valid attributes' do
        it "saves the new record in the database" do
          expect {
            post :create, organizer: attributes_for(:organizer)
          }.to change(Organizer, :count).by(1)
        end
        it "redirects to the new record" do
          post :create, organizer: attributes_for(:organizer)
          expect(controller).to set_flash[:notice].to("Organizer has been created.")
        end
      end

      context 'with invalid attributes' do
        it "does not save the new record in the database" do
          expect {
            post :create, organizer: attributes_for(:organizer, :invalid)
          }.not_to change(Organizer, :count)
        end
        it "re-renders the :new template" do
          post :create, organizer: attributes_for(:organizer, :invalid)
          expect(response).to render_template :new
        end
      end
    end

    describe 'PATCH #update' do
      context 'for allowed organizer with valid attributes' do
        before { patch :update, id: organizer.to_param, organizer: { organizer: 'changed' } }
        it "assigns the requested @organizer" do
          expect(assigns(:organizer)).to eq(organizer)
        end
        it "updates the record" do
          organizer.reload
          expect(assigns(:organizer)[:organizer]).to eq('changed')
        end
        it "redirects to updated record" do
          expect(response).to redirect_to organizer
        end
      end

      context 'for allowed organizer with invalid attributes' do
        before { patch :update, id: organizer.to_param, organizer: attributes_for(:organizer, :invalid) }
        it "does not change the attributes" do
          expect(assigns(:organizer)).to eq(organizer)
        end
        it { expect(response).to render_template :edit }
      end
    end

    describe 'DELETE #destroy' do
      it "deletes the record" do
        expect {
          delete :destroy, id: organizer.to_param
        }.to change(Organizer, :count).by(-1)
      end
      it "redirects to index" do
        delete :destroy, id: other_organizer.to_param
        expect(response).to redirect_to organizers_url
        expect(controller).to set_flash[:notice].to("Hosting organizer was successfully destroyed.")
      end
    end

  end
end
