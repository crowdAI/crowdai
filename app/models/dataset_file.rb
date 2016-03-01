class DatasetFile < ActiveRecord::Base
  belongs_to :dataset
end

# == Schema Information
#
# Table name: dataset_files
#
#  id         :integer          not null, primary key
#  dataset_id :integer
#  seq        :integer
#  filename   :string
#  filetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
