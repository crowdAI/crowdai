class DatasetFileDownload < ActiveRecord::Base
  belongs_to :participant
  belongs_to :dataset_file

  validates :ip_address, presence: true, uniqueness: false,
            format: { with: Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex) }
end
