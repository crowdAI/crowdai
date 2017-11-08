require 'rails_helper'

RSpec.describe ClefTasksController, type: :controller do
  render_views

  let(:organizer) { create :organizer }
  let(:organizer_admin) { create :participant, organizer: organizer }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:clef_task)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:clef_task, :invalid)
  }

  3.times do |i|
    let!("task_#{i + 1}") { create :clef_task, organizer: organizer }
  end

  context 'organizer_admin' do
    before do
      sign_in organizer_admin
    end

    describe 'GET #index' do
      before { get :index, params: { organizer_id: organizer.id } }
      it { expect(assigns(:clef_tasks).sort).to eq [task_1, task_2, task_3].sort }
      it { expect(response).to render_template :index }
    end

    describe "GET #new" do
      before { get :new, params: { organizer_id: organizer.id } }
      it { expect(assigns(:clef_task)).to be_a_new(ClefTask) }
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new ClefTask" do
          expect {
            post :create, params: { organizer_id: organizer.id, clef_task: valid_attributes }
          }.to change(ClefTask, :count).by(1)
        end

        it "assigns a newly created clef_task as @clef_task" do
          post :create, params: { organizer_id: organizer.id, clef_task: valid_attributes }
          expect(assigns(:clef_task)).to be_a(ClefTask)
          expect(assigns(:clef_task)).to be_persisted
        end

        it "redirects to index" do
          post :create, params: { organizer_id: organizer.id, clef_task: valid_attributes }
          expect(response).to redirect_to organizer_clef_tasks_path(organizer)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved clef_task as @clef_task" do
          post :create, params: { organizer_id: organizer.id, clef_task: invalid_attributes }
          expect(assigns(:clef_task)).to be_a_new(ClefTask)
        end

        it "re-renders the 'new' template" do
          post :create, params: { organizer_id: organizer.id, clef_task: invalid_attributes }
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { task: 'update task' }
        }

        it "updates the requested clef task" do
          put :update, params: { organizer_id: organizer.id, id: task_1.id, clef_task: new_attributes}
          task_1.reload
          expect(task_1.task).to eq(new_attributes[:task])
        end

        it "assigns the requested clef_task as @clef_task" do
          put :update, params: {organizer_id: organizer.id, id: task_1.to_param, clef_task: valid_attributes}
          #expect(assigns(:clef_task)).to eq(task_1)
        end

        it "redirects to the clef_task" do
        #  put :update, params: { organizer_id: organizer.id, id: task_1.to_param, clef_task: valid_attributes}
        #  expect(response).to redirect_to(clef_task)
        end
      end

      context "with invalid params" do
        it "assigns the clef_task as @clef_task" do
          #put :update, params: { organizer_id: organizer.id, id: task_1.to_param, clef_task: invalid_attributes}
          #expect(assigns(:clef_task)).to eq(task_1)
        end

        it "re-renders the 'edit' template" do
        #  put :update, params: { organizer_id: organizer.id, id: task_1.to_param, clef_task: invalid_attributes}
        #  expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested clef_task" do
        expect {
          delete :destroy, params: { organizer_id: organizer.id, id: task_1.to_param }
        }.to change(ClefTask, :count).by(-1)
      end

      it "redirects to the clef_tasks list" do
        delete :destroy, params: { organizer_id: organizer.id, id: task_1.to_param }
        #expect(response).to redirect_to(clef_tasks_url)
      end
    end
  end

end
