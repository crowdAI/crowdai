json.submissions do |json|
  json.array! @submissions do |submission|
    json.id submission.id
    json.challenge_id submission.challenge_id
  end
end
