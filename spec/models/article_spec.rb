require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article) { create(:article) }

  describe 'validations' do
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:summary) }
  end

  describe "fields" do
    it { is_expected.to respond_to :article }
    it { is_expected.to respond_to :summary }
    it { is_expected.to respond_to :category }
    it { is_expected.to respond_to :published }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :view_count }
    it { is_expected.to respond_to :comment_count }
  end

  describe "associations" do
    it { is_expected.to belong_to :participant }
    it { is_expected.to have_many :votes }
    it { is_expected.to have_many :article_sections }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_one :image }
  end

  describe "nested attributes" do
    it { is_expected.to accept_nested_attributes_for :article_sections }
    it { is_expected.to accept_nested_attributes_for :image }
  end


end
