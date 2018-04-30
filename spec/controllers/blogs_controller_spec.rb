require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  render_views

  let(:participant) { create :participant }
  let(:author) { create :participant }
  let(:admin) { create :participant, :admin }
  let!(:blog_1) { create :blog }
  let!(:blog_2) { create :blog }
  let!(:unpublished) {
    create :blog, published: false, participant_id: author.id }

  describe 'GET #index' do

    context 'public participant' do
      before { get :index }
      it { expect((assigns(:blogs)).sort)
        .to eq [blog_1, blog_2].sort }
      it { expect(response).to render_template :index }
    end

    context 'author' do
      before do
        sign_in(author)
        get :index
      end
      it { expect((assigns(:blogs)).sort)
        .to eq [blog_1, blog_2, unpublished].sort }
      it { expect(response).to render_template :index }
    end

    context 'admin' do
      before do
        sign_in(admin)
        get :index
      end
      it { expect((assigns(:blogs)).sort)
        .to eq [blog_1, blog_2, unpublished].sort }
      it { expect(response).to render_template :index }
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: blog_1.id}
      expect(response).to be_success
    end
  end

end
