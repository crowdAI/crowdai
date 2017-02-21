module Crowdai
  class InvalidS3Key < StandardError
    def initialize(data)
      @data = data
    end
  end
end

# raise InvalidS3Key.new(s3_key: 'ssssss')
