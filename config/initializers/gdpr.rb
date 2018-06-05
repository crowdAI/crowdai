=begin
require 'gdpr_exporter'
ActiveRecord::Base.send :include, GdprExporter

Participant.gdpr_collect :email,
  :last_sign_in_at,
  :created_at,
  :updated_at,
  :timezone,
  :name,
  :bio,
  :website,
  :github,
  :linkedin,
  :twitter,
  :image_file,
  :affiliation,
  :country_cd,
  :address,
  :first_name,
  :last_name,
  {
    user_id: :id, desc: "This is your basic information.",
    renamed_fields: {
      sign_in_count: "sign in count",
      current_sign_in_at: "time of current sign in",
      current_sign_in_ip: "current IP address",
      last_sign_in_ip: "previously used IP address"
    }
  }
=end

GDPR_FIELDS = [
  table: 'Participant',
  id_field: 'id',
  fields: [
    :email,
    :created_at,
    :updated_at,
    :timezone,
    :name,
    :bio,
    :website,
    :github,
    :linkedin,
    :twitter,
    :image_file,
    :affiliation,
    :country_cd,
    :address,
    :first_name,
    :last_name
  ]
]
