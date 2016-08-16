# -*- encoding: utf-8 -*-

require 'spec_helper'

describe UpdateChallengeStatsJob do

  
  describe '#perform' do
    it 'works' do
      update_challenge_stats_job = UpdateChallengeStatsJob.new
      result = update_challenge_stats_job.perform
      expect(result).not_to be_nil
    end
  end

  
  describe '#update_submissions' do
    it 'works' do
      update_challenge_stats_job = UpdateChallengeStatsJob.new
      result = update_challenge_stats_job.update_submissions
      expect(result).not_to be_nil
    end
  end

  
  describe '#update_participants' do
    it 'works' do
      update_challenge_stats_job = UpdateChallengeStatsJob.new
      result = update_challenge_stats_job.update_participants
      expect(result).not_to be_nil
    end
  end

end
