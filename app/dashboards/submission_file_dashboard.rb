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
    filename: Field::String,
    filetype: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
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
    :filename,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :submission,
    :id,
    :seq,
    :filename,
    :filetype,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :submission,
    :seq,
    :filename,
    :filetype,
  ]

  # Overwrite this method to customize how submission files are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(submission_file)
  #   "SubmissionFile ##{submission_file.id}"
  # end
end
