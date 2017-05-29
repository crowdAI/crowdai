require 'rails_helper'

describe Challenge do
  context 'fields' do
    it { is_expected.to respond_to :challenge }
    it { is_expected.to respond_to :status_cd }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :evaluation_markdown }
    it { is_expected.to respond_to :rules }
    it { is_expected.to respond_to :prizes }
    it { is_expected.to respond_to :resources }
    it { is_expected.to respond_to :dataset_description }
    it { is_expected.to respond_to :submission_instructions }
    it { is_expected.to respond_to :tagline }
    it { is_expected.to respond_to :evaluation }
    it { is_expected.to respond_to :primary_sort_order_cd }
    it { is_expected.to respond_to :secondary_sort_order_cd }
    it { is_expected.to respond_to :description_markdown }
    it { is_expected.to respond_to :rules_markdown }
    it { is_expected.to respond_to :prizes_markdown }
    it { is_expected.to respond_to :resources_markdown }
    it { is_expected.to respond_to :dataset_description_markdown }
    it { is_expected.to respond_to :submission_instructions_markdown }
    it { is_expected.to respond_to :perpetual_challenge }
    it { is_expected.to respond_to :grading_factor }
    it { is_expected.to respond_to :grader_cd }
    it { is_expected.to respond_to :answer_file_s3_key }
    it { is_expected.to respond_to :page_views }
    it { is_expected.to respond_to :license }
    it { is_expected.to respond_to :license_markdown }
    it { is_expected.to respond_to :participant_count }
    it { is_expected.to respond_to :submission_count }
    it { is_expected.to respond_to :score_title }
    it { is_expected.to respond_to :automatic_grading }
    it { is_expected.to respond_to :slug }
    it { is_expected.to respond_to :submission_license }
    it { is_expected.to respond_to :score_secondary_title }
    it { is_expected.to respond_to :daily_submissions }
    it { is_expected.to respond_to :threshold }
    it { is_expected.to respond_to :media_on_leaderboard }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :api_key }
    it { is_expected.to respond_to :image_file }
  end

  context 'associations' do
    it { is_expected.to belong_to(:organizer) }
    it { is_expected.to have_many(:dataset_files) }
    it { is_expected.to have_many(:submission_file_definitions) }
    it { is_expected.to accept_nested_attributes_for :submission_file_definitions }
    it { is_expected.to have_many(:submissions) }
    #it { is_expected.to have_many(:leaderboards) }
    it { is_expected.to have_many(:ongoing_leaderboards) }
    it { is_expected.to have_many(:participant_challenges) }
    it { is_expected.to have_many(:topics) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index ["organizer_id"] }
  end

=begin
  context 'validations' do
    it { is_expected.to validate_presence_of(:challenge) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:organizer_id) }
    it { is_expected.to validate_presence_of(:grader) }
    it { is_expected.to validate_presence_of(:primary_sort_order) }
    it { is_expected.to validate_presence_of(:grading_factor) }
  end
=end
  context 'methods' do
    describe 'validate markdown fields' do
      let(:challenge) { create :challenge }
      it 'description' do
        challenge.update!(description_markdown: '### The description')
        expect(challenge.description).to eq("<h3>The description</h3>\n")
      end
      it 'evaluation' do
        challenge.update!(evaluation_markdown: '# An evaluation')
        expect(challenge.evaluation).to eq("<h1>An evaluation</h1>\n")
      end
      it 'rules' do
        challenge.update!(rules_markdown: "Some *rules*")
        expect(challenge.rules).to eq("<p>Some <em>rules</em></p>\n")
      end
      it 'prizes' do
        challenge.update!(prizes_markdown: "# Prizes are described here.")
        expect(challenge.prizes).to eq("<h1>Prizes are described here.</h1>\n")
      end
      it 'resources' do
        challenge.update!(resources_markdown: "# Helpful resources")
        expect(challenge.resources).to eq("<h1>Helpful resources</h1>\n")
      end
      it 'dataset_description' do
        challenge.update!(dataset_description_markdown: "# Dataset description")
        expect(challenge.dataset_description).to eq("<h1>Dataset description</h1>\n")
      end
      it 'submission_instructions' do
        challenge.update!(submission_instructions_markdown: "## Submission instructions")
        expect(challenge.submission_instructions).to eq("<h2>Submission instructions</h2>\n")
      end
    end

    describe 'after_initialize' do
      it 'sets submission information defaults' do
        challenge = create(:challenge)
        expect(challenge.submission_license).to eq("Please upload your submissions and include a detailed description of the methodology, techniques and insights leveraged with this submission. After the end of the challenge, these comments will be made public, and the submitted code and models will be freely available to other crowdAI participants. All submitted content will be licensed under Creative Commons (CC).")
        expect(challenge.daily_submissions).to eq(5)
      end
    end


    describe '#record_page_view' do
      it 'returns 1 for the first view' do
        article = build(:article)
        article.record_page_view
        expect(article.view_count).to eq(1)
      end

      it 'returns 3 for the third view' do
        article = build(:article)
        3.times { article.record_page_view }
        expect(article.view_count).to eq(3)
      end
    end

    describe '#valid_status' do
      it 'does not allow a challenge to be running without dataset files' do
        challenge = create(:challenge)
        expect {
          challenge.update!(status: :running)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'prevents a draft challenge being cancelled' do
        challenge = create(:challenge, :draft)
        expect {
          challenge.update!(status: :cancelled)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'prevents a completed challenge being cancelled' do
        challenge = create(:challenge, :draft)
        expect {
          challenge.update!(status: :completed)
          challenge.update!(status: :cancelled)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end


    end

    describe "friendly_id" do
      it 'updates the slug when the challenge title changes' do
        challenge = create(:challenge)
        challenge.challenge = 'a new challenge title'
        challenge.save!
        expect(challenge.slug).to eq('a-new-challenge-title')
      end
    end

    context 'API key' do
      let!(:challenge) { create :challenge }
      it 'API key is created when account created' do
        expect(challenge.api_key.length).to eq(32)
      end

      it 'API key can be updated' do
        api_key = challenge.api_key
        challenge.update(api_key: challenge.generate_api_key)
        expect(challenge.api_key.length).to eq(32)
        expect(challenge.api_key).not_to eq(api_key)
      end
    end

  end
end
