require 'rails_helper'

describe Image do
  context 'associations' do
    it { should belong_to(:imageable) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["imageable_type", "imageable_id"] }
  end

  describe "An Image instance" do
      let(:image) { create :image, image: File.new("#{Rails.root}/spec/support/files/p_image5.jpg") }
      it { expect(image).to be_valid }
      # it { expect(image.get_true_size).to eql "500.0,375.0" }
      # TODO THIS TEST FAILS ONLY ON TRAVIS CI
    end

    describe "An Avatar instance" do
      let(:participant) { create :participant }
      let(:image) { create :image, imageable: participant }
      it { expect(image).to be_freshly_uploaded_avatar }
    end

end
