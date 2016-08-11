require 'rails_helper'

RSpec.describe Challenge, type: :model do
  let!(:challenge) { create(:challenge) }

  describe 'validations' do
    it { should validate_presence_of(:challenge) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:organizer) }

    it "should allow valid values" do
      %w(draft running completed cancelled).each do |v|
        should allow_value(v).for(:status)
      end
    end
    it { should_not allow_value("other").for(:status) }
  end

  describe 'fields' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :organizer_id }
    it { is_expected.to respond_to :challenge }
    it { is_expected.to respond_to :status_cd }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :evaluation_markdown }
    it { is_expected.to respond_to :evaluation }
    it { is_expected.to respond_to :rules }
    it { is_expected.to respond_to :prizes }
    it { is_expected.to respond_to :resources }
    it { is_expected.to respond_to :created_at }
    it { is_expected.to respond_to :updated_at }
    it { is_expected.to respond_to :dataset_description }
    it { is_expected.to respond_to :submission_instructions }
    it { is_expected.to respond_to :tagline }
    it { is_expected.to respond_to :description_markdown }
    it { is_expected.to respond_to :evaluation_markdown }
    it { is_expected.to respond_to :rules_markdown }
    it { is_expected.to respond_to :prizes_markdown }
    it { is_expected.to respond_to :resources_markdown }
    it { is_expected.to respond_to :dataset_description_markdown }
    it { is_expected.to respond_to :submission_instructions_markdown }
  end

  describe 'associations' do
    it { is_expected.to belong_to :organizer }
    it { is_expected.to have_one :image }
    it { is_expected.to have_many :dataset_files }
    it { is_expected.to have_many :events }
    it { is_expected.to have_many :submissions }
    it { is_expected.to have_many :leaderboards }
    it { is_expected.to have_many :topics }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for :dataset_files }
    it { is_expected.to accept_nested_attributes_for :image }
    it { is_expected.to accept_nested_attributes_for :events }
  end

  describe 'database indexes' do
    it { is_expected.to have_db_index ["organizer_id"] }
  end

  describe 'validate markdown fields' do
    let(:challenge) { create :challenge, :with_events }
    it { expect(challenge.description).to eq("<h3>The description</h3>\n")}
    it { expect(challenge.evaluation).to eq("<h1>An evaluation</h1>\n")}
    it { expect(challenge.rules).to eq("<p>Some <em>rules</em></p>\n")}
    it { expect(challenge.prizes).to eq("<h1>Prizes are described here.</h1>\n")}
    it { expect(challenge.resources).to eq("<h1>Helpful resources</h1>\n")}
    it { expect(challenge.dataset_description).to eq("<h1>Dataset description</h1>\n")}
    it { expect(challenge.submission_instructions).to eq("<h2>Submission instructions</h2>\n")}
  end

end
