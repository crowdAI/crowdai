require 'rails_helper'
=begin
describe ArticlePolicy do
  context "for a published article" do
    subject { described_class.new(user, article) }

    let(:article) { create(:article, user: author) }
    let(:author) { create(:user) }
    let(:admin) { create(:user, :admin )}

    context 'for a public user' do
      let(:user) { nil }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    context 'for the author' do
      let(:user) { author }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:destroy) }
    end

    context 'for an admin' do
      let(:user) { admin }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:destroy) }
    end
  end
end
=end
