class RoundDateTimeValidator < ActiveModel::Validator
  def validate(challenge)
    errors = false
    prev_round = nil
    challenge.challenge_rounds.each_with_index do |round,idx|
      if prev_round.present?
        if round.start_dttm - prev_round.end_dttm != 0
          errors = true
        end
      end
      prev_round = round
    end
    if errors
      challenge.errors[:challenge] << 'Please ensure there are no overlapping or gaps between challenge rounds.'
    end
  end
end
