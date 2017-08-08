class ProcessAiGymGifJob < ApplicationJob

  def perform(submission_id,aws_gif_key)
    ProcessAiGymGif.new(submission_id,aws_gif_key).call
  end

end
