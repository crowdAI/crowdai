require 'rails_helper'

RSpec.describe Image, type: :model do
  # === Relations ===
  it { is_expected.to belong_to :imageable }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :imageable_id }
  it { is_expected.to have_db_column :imageable_type }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :image_file_name }
  it { is_expected.to have_db_column :image_content_type }
  it { is_expected.to have_db_column :image_file_size }
  it { is_expected.to have_db_column :image_updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["imageable_type", "imageable_id"] }

  
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
