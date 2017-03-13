require 'rails_helper'

describe Challenge do
  context 'associations' do
    it { should belong_to(:organizer) }
    it { should have_one(:image).dependent(:destroy) }
    it { should have_many(:dataset_files) }
    it { should have_many(:docker_configurations) }
    it { should have_many(:submission_file_definitions) }
    it { should accept_nested_attributes_for :submission_file_definitions }
    it { should have_many(:submissions) }
    #it { should have_many(:leaderboards) }
    it { should have_many(:ongoing_leaderboards) }
    it { should have_many(:participant_challenges) }
    it { should have_many(:topics) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index ["organizer_id"] }
  end

=begin
  context 'validations' do
    it { should validate_presence_of(:challenge) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:organizer_id) }
    it { should validate_presence_of(:grader) }
    it { should validate_presence_of(:primary_sort_order) }
    it { should validate_presence_of(:grading_factor) }
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

      it 'permits a running challenge to be cancelled' do
        challenge = create(:challenge, :running)
        challenge.update!(status: :cancelled)
        expect(challenge.status).to eq(:cancelled)
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


  end
end
