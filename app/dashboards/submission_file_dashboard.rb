require "administrate/base_dashboard"

class SubmissionFileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    submission: Field::BelongsTo,
    id: Field::Number,
    seq: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    submission_file_file_name: Field::String,
    submission_file_content_type: Field::String,
    submission_file_file_size: Field::Number,
    submission_file_updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :submission,
    :id,
    :seq,
    :created_at,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :submission,
    :id,
    :seq,
    :created_at,
    :updated_at,
    :submission_file_file_name,
    :submission_file_content_type,
    :submission_file_file_size,
    :submission_file_updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :submission,
    :seq,
    :submission_file_file_name,
    :submission_file_content_type,
    :submission_file_file_size,
    :submission_file_updated_at,
  ]

  # Overwrite this method to customize how submission files are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(submission_file)
  #   "SubmissionFile ##{submission_file.id}"
  # end
end
