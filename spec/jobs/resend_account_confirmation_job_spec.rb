# -*- encoding: utf-8 -*-

require 'spec_helper'

describe ResendAccountConfirmationJob do

  
  describe '#perform' do
    it 'works' do
      resend_account_confirmation_job = ResendAccountConfirmationJob.new
      participant_id = double('participant_id')
      result = resend_account_confirmation_job.perform(participant_id)
      expect(result).not_to be_nil
    end
  end

end
