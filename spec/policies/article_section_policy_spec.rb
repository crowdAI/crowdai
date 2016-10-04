require 'rails_helper'
require 'support/pundit_matcher'

describe ArticleSectionPolicy do
  context "for a published article" do
    subject { ArticleSectionPolicy.new(participant, article_section) }

    let(:article_section) { create(:article, :with_sections, participant: author).article_sections.first }
    let(:author) { create(:participant) }
    let(:admin) { create(:participant, :admin )}

    context 'for a public participant' do
      let(:participant) { nil }

      it { should authorize(:show) }
      it { should authorize(:index) }
      it { should_not authorize(:create) }
      it { should_not authorize(:new) }
      it { should_not authorize(:update) }
      it { should_not authorize(:edit) }
      it { should_not authorize(:destroy) }
    end

    context 'for the author' do
      let(:participant) { author }

      it { should authorize(:show) }
      it { should authorize(:index) }
      it { should_not authorize(:create) }
      it { should_not authorize(:new) }
#      it { should authorize(:update) }
  #    it { should authorize(:edit) }
      it { should_not authorize(:destroy) }
    end

    context 'for an admin' do
      let(:participant) { admin }

      it { should authorize(:show) }
      it { should authorize(:index) }
      it { should authorize(:create) }
      it { should authorize(:new) }
      it { should authorize(:update) }
      it { should authorize(:edit) }
      it { should authorize(:destroy) }
    end
  end
end
