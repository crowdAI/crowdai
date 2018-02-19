class UpdateUrls < ActiveRecord::Migration[5.1]
  def change
    Submission.all.each do |submission|
      generate_short_url(submission)
    end
  end

  def generate_short_url(submission)
    if submission.short_url.blank?
      short_url = nil
      begin
        short_url = SecureRandom.hex(6)
      end while (Submission.exists?(short_url: short_url))
      submission.short_url = short_url
      submission.save
    end
  end
end
