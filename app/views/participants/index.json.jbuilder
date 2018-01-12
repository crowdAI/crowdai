json.array!(@participants) do |participant|
  json.id participant.id
  json.name participant.name
  json.thumbnail_url image_path participant.image_url
end
