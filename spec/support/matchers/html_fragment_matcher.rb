require 'rspec/expectations'

RSpec::Matchers.define :be_a_valid_html_fragment do |expected|
  match do |actual|
    doc = Nokogiri::HTML(actual) do |config|
      actual.strict
      return false if doc.errors.any?
    end
  end
  failure_message_for_should do |actual|
    "it should be a valid html fragment"
  end
end
