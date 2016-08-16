# -*- encoding: utf-8 -*-

require 'spec_helper'

describe TopicDashboard do

  
  describe '#display_resource' do
    it 'works' do
      topic_dashboard = TopicDashboard.new
      topic = double('topic')
      result = topic_dashboard.display_resource(topic)
      expect(result).not_to be_nil
    end
  end

end
