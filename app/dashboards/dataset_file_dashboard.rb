require "administrate/base_dashboard"

class DatasetFileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    challenge: Field::BelongsTo,
    dataset_file_downloads: Field::HasMany,
    id: Field::Number,
    seq: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::String,
    dataset_file_s3_key: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :challenge,
    :dataset_file_downloads,
    :seq
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :challenge,
    :dataset_file_downloads,
    :seq,
    :created_at,
    :updated_at,
    :description,
    :dataset_file_s3_key,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenge,
    :dataset_file_downloads,
    :seq,
    :description,
    :dataset_file_s3_key,
  ]

  # Overwrite this method to customize how dataset files are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(dataset_file)
     "#{dataset_file.description}"
  end
end
