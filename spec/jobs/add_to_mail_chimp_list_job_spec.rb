# -*- encoding: utf-8 -*-

require 'spec_helper'

describe AddToMailChimpListJob do

  
  describe '#perform' do
    it 'works' do
      add_to_mail_chimp_list_job = AddToMailChimpListJob.new
      participant_id = double('participant_id')
      result = add_to_mail_chimp_list_job.perform(participant_id)
      expect(result).not_to be_nil
    end
  end

  
  describe '#disable_account' do
    it 'works' do
      add_to_mail_chimp_list_job = AddToMailChimpListJob.new
      participant_id = double('participant_id')
      reason = double('reason')
      result = add_to_mail_chimp_list_job.disable_account(participant_id, reason)
      expect(result).not_to be_nil
    end
  end

end
