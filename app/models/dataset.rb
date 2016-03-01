class Dataset < ActiveRecord::Base
  belongs_to :competition
  has_many :dataset_files, dependent: :destroy
  accepts_nested_attributes_for :dataset_files, reject_if: :all_blank, allow_destroy: true
end

# == Schema Information
#
# Table name: datasets
#
#  id             :integer          not null, primary key
#  competition_id :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
