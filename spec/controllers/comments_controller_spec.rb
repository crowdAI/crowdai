require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  render_views

  let!(:topic) { create :topic }
  let!(:participant) { create :participant }

  def valid_attributes
    {
      comment_markdown: "### This is a comment"
    }
  end

  context 'participant' do
    before do
      sign_in participant
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Comment" do
          expect {
            post :create, params: { topic_id: topic.id, comment: valid_attributes }
          }.to change(Comment, :count).by(1)
        end
      end
    end
  end

  context 'public user' do
    describe "POST #create" do
      context "with valid params" do
        it "creates a new Comment" do
          post :create, params: { topic_id: topic.id, comment: valid_attributes }
          expect(response).to redirect_to(new_participant_session_path)
        end
      end
    end
  end

end
