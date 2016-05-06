require "administrate/base_dashboard"

class DatasetFileDownloadDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    participant: Field::BelongsTo,
    dataset_file: Field::BelongsTo,
    id: Field::Number,
    ip_address: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :participant,
    :dataset_file,
    :id,
    :ip_address,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :participant,
    :dataset_file,
    :id,
    :ip_address,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :participant,
    :dataset_file,
    :ip_address,
  ]

  # Overwrite this method to customize how dataset file downloads are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(dataset_file_download)
  #   "DatasetFileDownload ##{dataset_file_download.id}"
  # end
end
