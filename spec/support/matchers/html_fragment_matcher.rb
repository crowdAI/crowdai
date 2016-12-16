require 'rspec/expectations'

RSpec::Matchers.define :be_a_valid_html_fragment do |expected|
  match do |actual|
    begin
      doc = Nokogiri::XML(actual) { |config| config.strict }
    rescue Nokogiri::XML::SyntaxError => e
      puts "caught exception: #{e}"
      puts actual
    end
  end
  failure_message do |actual|
    # TODO pass back the Nokogiri exception as the failure message
    "it should be a valid html fragment"
  end
end
