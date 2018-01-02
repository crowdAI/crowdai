json.array!(@participants) do |participant|
  json.id participant.id
  json.name participant.name
end
