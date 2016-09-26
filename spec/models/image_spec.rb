require 'rails_helper'

describe Image do
  context 'associations' do
    it { should belong_to(:imageable) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["imageable_type", "imageable_id"] }
  end

  context 'methods' do
    describe '#cropping?' do
      it 'works' do
        image = Image.new
        result = image.cropping?
        expect(result).not_to be_nil
      end
    end

    describe '#freshly_uploaded_avatar?' do
      it 'works' do
        image = Image.new
        result = image.freshly_uploaded_avatar?
        expect(result).not_to be_nil
      end
    end


    describe '#get_true_size' do
      it 'works' do
        image = Image.new
        result = image.get_true_size
        expect(result).not_to be_nil
      end
    end

    describe '#do_crop_reprocess' do
      it 'works' do
        image = Image.new
        result = image.do_crop_reprocess
        expect(result).not_to be_nil
      end
    end

    describe '#do_avatar_reprocess' do
      it 'works' do
        image = Image.new
        result = image.do_avatar_reprocess
        expect(result).not_to be_nil
      end
    end
  end

end
