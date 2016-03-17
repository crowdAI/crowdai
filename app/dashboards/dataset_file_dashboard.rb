require "administrate/base_dashboard"

class DatasetFileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    competition: Field::BelongsTo,
    id: Field::Number,
    seq: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::String,
    dataset_file_file_name: Field::String,
    dataset_file_content_type: Field::String,
    dataset_file_file_size: Field::Number,
    dataset_file_updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :competition,
    :id,
    :seq,
    :created_at,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :competition,
    :id,
    :seq,
    :created_at,
    :updated_at,
    :description,
    :dataset_file_file_name,
    :dataset_file_content_type,
    :dataset_file_file_size,
    :dataset_file_updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :competition,
    :seq,
    :description,
    :dataset_file_file_name,
    :dataset_file_content_type,
    :dataset_file_file_size,
    :dataset_file_updated_at,
  ]

  # Overwrite this method to customize how dataset files are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(dataset_file)
  #   "DatasetFile ##{dataset_file.id}"
  # end
end
