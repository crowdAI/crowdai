require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe "pages#contact" do
    before { get :contact }
    it { expect(response).to render_template(:contact) }
  end

  describe "pages#privacy" do
    before { get :privacy }
    it { expect(response).to render_template(:privacy) }
  end

  describe "pages#terms" do
    before { get :terms }
    it { expect(response).to render_template(:terms) }
  end

end
