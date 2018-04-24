require 'rails_helper'

feature "create knowledge base article" do
  let(:participant) { create :participant }
  let(:admin) { create :participant, :admin }

  context 'not logged in' do

  end

  context 'participant' do
  end

  context 'admin' do
    
  end

end
