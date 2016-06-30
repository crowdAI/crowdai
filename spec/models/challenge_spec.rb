require 'rails_helper'

RSpec.describe Challenge, type: :model do
  before do
    @challenge = build(:challenge)
  end

  describe 'simple model pre-checks' do
    subject { @challenge }

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
    subject { @challenge }

    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :organizer_id }
    it { is_expected.to have_db_column :challenge }
    it { is_expected.to have_db_column :status_cd }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :evaluation_markdown }
    it { is_expected.to have_db_column :evaluation }
    it { is_expected.to have_db_column :rules }
    it { is_expected.to have_db_column :prizes }
    it { is_expected.to have_db_column :resources }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :dataset_description }
    it { is_expected.to have_db_column :submission_instructions }
    it { is_expected.to have_db_column :tagline }
    it { is_expected.to have_db_column :description_markdown }
    it { is_expected.to have_db_column :evaluation_markdown }
    it { is_expected.to have_db_column :rules_markdown }
    it { is_expected.to have_db_column :prizes_markdown }
    it { is_expected.to have_db_column :resources_markdown }
    it { is_expected.to have_db_column :dataset_description_markdown }
    it { is_expected.to have_db_column :submission_instructions_markdown }
  end

  describe 'associations' do
    subject { @challenge }

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

  describe 'specific validations' do
    it { is_expected.to validate_presence_of :challenge }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :organizer }
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
