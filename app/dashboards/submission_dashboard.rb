require "administrate/base_dashboard"

class SubmissionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    challenge: Field::BelongsTo,
    participant: Field::BelongsTo,
    submission_files: Field::HasMany,
    id: Field::Number,
    score: Field::Number.with_options(decimals: 6),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    framework: Field::String,
    score_secondary: Field::Number.with_options(decimals: 6),
    grading_message: Field::String,
    grading_status: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :challenge,
    :participant,
    :grading_status,
    :score,
    :score_secondary
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :challenge,
    :participant,
    :submission_files,
    :grading_status,
    :grading_message,
    :score,
    :score_secondary,
    :created_at,
    :updated_at,
    :description,
    :framework
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenge,
    :participant,
    :submission_files,
    :score,
    :description,
    :framework,
    :score_secondary,
    :grading_message,
    :grading_status
  ]

  # Overwrite this method to customize how submissions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(submission)
     "#{submission.participant.name}"
  end
end
