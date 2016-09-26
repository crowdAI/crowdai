class DatasetFileDownload < ActiveRecord::Base
  belongs_to :participant
  belongs_to :dataset_file

  validates :ip_address,
            presence: true,
            uniqueness: false,
            format: { with: Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex) }
  validates :participant_id,      presence: true
  validates :dataset_file_id,     presence: true
end
