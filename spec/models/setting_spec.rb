require 'rails_helper'

RSpec.describe Setting, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :jobs_visible }
  end
end
