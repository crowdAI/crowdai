require 'gdpr_exporter'
ActiveRecord::Base.send :include, GdprExporter

Participant.gdpr_collect :email,
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
    user_id: :id, desc: "This is your basic information."
  }
