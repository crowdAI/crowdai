class Api::ParticipantSerializer < ActiveModel::Serializer

  attributes :id,
    :email,
    :api_key,
    :name
    
end
