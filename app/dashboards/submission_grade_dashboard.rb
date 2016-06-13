require "administrate/base_dashboard"

class SubmissionGradeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    submission: Field::BelongsTo,
    id: Field::Number,
    grading_status_cd: Field::String,
    grading_message: Field::String,
    grading_factor: Field::Number.with_options(decimals: 2),
    score: Field::Number.with_options(decimals: 8),
    score_secondary: Field::Number.with_options(decimals: 8),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :submission,
    :id,
    :grading_status_cd,
    :grading_factor,
    :score,
    :score_secondary,
    :grading_message,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :submission,
    :id,
    :grading_status_cd,
    :grading_message,
    :grading_factor,
    :score,
    :score_secondary,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :submission,
    :grading_status_cd,
    :grading_message,
    :grading_factor,
    :score,
    :score_secondary,
  ].freeze

  # Overwrite this method to customize how submission grades are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(submission_grade)
  #   "SubmissionGrade ##{submission_grade.id}"
  # end
end
