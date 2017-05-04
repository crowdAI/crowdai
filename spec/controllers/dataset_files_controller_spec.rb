require 'rails_helper'

RSpec.describe DatasetFilesController, type: :controller do

  let!(:challenge) { create :challenge, :running }
  let!(:file1) { create :dataset_file, challenge: challenge, title: 'file1' }
  let!(:file2) { create :dataset_file, challenge: challenge, title: 'file2' }
  let!(:participant) { create :participant }

  context 'participant' do
    before do
      sign_in participant
    end

    describe 'GET #index' do
      before { get :index, challenge_id: challenge.id }
      it { expect((assigns(:dataset_files).map(&:title)).sort).to eq ['first_file','file1', 'file2'].sort }
      it { expect(response).to render_template :index }
    end

    describe "GET #new" do
      it "assigns a new dataset_file as @dataset_file" do
        get :new, { challenge_id: challenge.id }
        expect(assigns(:dataset_file)).to be_a_new(DatasetFile)
      end
    end

    describe "DELETE #destroy" do
      before { delete :destroy, params: {challenge_id: challenge.id, id: file1.id }}
      it { expect { DatasetFile.count }.to change by -1 }
      it { expect(response).to redirect_to(challenge_dataset_files_path(challenge)) }
      it { expect(flash[:notice]).to match "Dataset file #{file1.title} was deleted." }
    end

  end

end
