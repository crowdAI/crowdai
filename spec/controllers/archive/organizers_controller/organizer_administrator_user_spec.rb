require 'rails_helper'

RSpec.describe OrganizersController, type: :controller do
  let!(:organizer) { create :organizer }
  let!(:other_organizer) { create :organizer, organizer: 'other' }
  let!(:organizer_admin) { create :participant, organizer_id: organizer.id }

  context 'organizer administrator user' do
    before { sign_in organizer_admin }

    describe 'GET #index' do
      before { get :index }
      it "assigns for the admin organizer" do
        expect(assigns(:organizers)).to eq([organizer])
      end
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      context 'for allowed organizer' do
        before { get :show, id: organizer.to_param }
        it "assigns for the admin organizer" do
          expect(assigns(:organizer)).to eq(organizer)
        end
        it { expect(response).to render_template :show }
      end

      context 'redirect GET #show for non-allowed organizer' do
        before { get :show, id: other_organizer.to_param }
        it { expect(response).to redirect_to root_path }
        it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
      end
    end

    describe 'redirect GET #new for organizer admin' do
      before { get :new }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

    describe 'GET #edit' do
      context 'for allowed organizer' do
        before { get :edit, id: organizer.to_param }
        it "assigns for the admin organizer" do
          expect(assigns(:organizer)).to eq(organizer)
        end
        it { expect(response).to render_template :edit }
      end

      context 'redirect GET #edit for non-allowed organizer' do
        before { get :edit, id: other_organizer.to_param }
        it { expect(response).to redirect_to root_path }
        it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
      end
    end

    describe 'redirect POST #create for organizer admin' do
      before { post :create, organizer: attributes_for(:organizer) }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

    describe 'PATCH #update' do
      context 'for allowed organizer with valid attributes' do
        before { patch :update, id: organizer.to_param, organizer: { description: 'changed' } }
        it "assigns the requested @organizer" do
          expect(assigns(:organizer)).to eq(organizer)
        end
        it "updates the record" do
          organizer.reload
          expect(assigns(:organizer)[:description]).to eq('changed')
        end
        it "redirects to updated record" do
          expect(response).to redirect_to organizer
        end
        it { expect(controller).to set_flash[:notice].to("Hosting organizer was successfully updated.") }
      end

      context 'for allowed organizer with invalid attributes' do
        before { patch :update, id: organizer.to_param, organizer: attributes_for(:organizer, :invalid) }
        it "does not change the attributes" do
          expect(assigns(:organizer)).to eq(organizer)
        end
        it { expect(response).to render_template :edit }
      end

      context 'redirect PATCH #edit for non-allowed organizer' do
        before { get :edit, id: other_organizer.to_param }
        it { expect(response).to redirect_to root_path }
        it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
      end
    end

    describe 'redirect DELETE #destroy for organizer admin' do
      before { delete :destroy, id: other_organizer.to_param }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end
  end  # context 'organizer administrator'

end
