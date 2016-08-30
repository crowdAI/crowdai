# -*- encoding: utf-8 -*-

require 'spec_helper'

describe ApplicationPolicy do


  describe '#new' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      result = ApplicationPolicy.new(participant, record)
      expect(result).not_to be_nil
    end
  end


  describe '#index?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.index?
      expect(result).not_to be_nil
    end
  end


  describe '#show?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.show?
      expect(result).not_to be_nil
    end
  end


  describe '#create?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.create?
      expect(result).not_to be_nil
    end
  end


  describe '#new?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.new?
      expect(result).not_to be_nil
    end
  end


  describe '#update?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.update?
      expect(result).not_to be_nil
    end
  end


  describe '#edit?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.edit?
      expect(result).not_to be_nil
    end
  end


  describe '#destroy?' do
    it 'works' do
      participant = double('participant')
      record = double('record')
      application_policy = ApplicationPolicy.new(participant, record)
      result = application_policy.destroy?
      expect(result).not_to be_nil
    end
  end


  

end
