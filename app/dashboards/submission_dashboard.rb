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
    team: Field::BelongsTo,
    submission_files: Field::HasMany,
    id: Field::Number,
    evaluated: Field::Boolean,
    score: Field::Number.with_options(decimals: 6),
    score_secondary: Field::Number.with_options(decimals: 6),
    submission_type_cd: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    grading_message: Field::String
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :challenge,
    :team,
    :participant,
    :submission_files,
    :evaluated,
    :score,
    :score_secondary,
    :grading_message
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :challenge,
    :participant,
    :team,
    :submission_files,
    :id,
    :evaluated,
    :score,
    :score_secondary,
    :grading_message,
    :submission_type_cd,
    :created_at,
    :updated_at,
    :description,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenge,
    :participant,
    :team,
    :submission_files,
    :evaluated,
    :score,
    :score_secondary,
    :grading_message,
    :submission_type_cd,
    :description,
  ]

  # Overwrite this method to customize how submissions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(submission)
     "#{submission.participant.name}-#{submission.id}"
  end
end
