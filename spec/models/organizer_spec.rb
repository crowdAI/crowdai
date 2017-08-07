# == Schema Information
#
# Table name: organizers
#
#  id                 :integer          not null, primary key
#  organizer          :string
#  address            :text
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  approved           :boolean          default(FALSE)
#  slug               :string
#  image_file         :string
#  tagline            :string
#  challenge_proposal :string
#
# Indexes
#
#  index_organizers_on_slug  (slug) UNIQUE
#

require 'rails_helper'

describe Organizer do
  context 'fields' do
    it { is_expected.to respond_to :organizer }
    it { is_expected.to respond_to :address }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :approved }
  end

  context 'associations' do
    it { is_expected.to have_many(:challenges) }
    it { is_expected.to have_many(:participants) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :organizer }
    it { is_expected.to validate_presence_of :tagline }
  end
end
