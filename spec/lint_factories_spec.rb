require 'rails_helper'

RSpec.describe FactoryGirl do
  described_class.factories.each do |factory|
    if factory.defined_traits.empty?
      factory_instance = described_class.build(factory.name)
      describe "#{factory.name} factory" do
        it 'is valid' do
          expect(factory_instance).to be_valid, -> { factory_instance.errors.full_messages.join("\n") }
        end
      end
    else
      factory.defined_traits.each do |trait|
        factory_instance = described_class.build(factory.name, trait.name)
        describe "#{factory.name} factory, trait #{trait.name}" do
          it 'is valid' do
            expect(factory_instance).to be_valid, -> { factory_instance.errors.full_messages.join("\n") }
          end
        end
      end
    end
  end
end
