require "administrate/base_dashboard"

class SubmissionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    competition: Field::BelongsTo,
    user: Field::BelongsTo,
    team: Field::BelongsTo,
    submission_files: Field::HasMany,
    id: Field::Number,
    evaluated: Field::Boolean,
    score: Field::Number.with_options(decimals: 2),
    ranking: Field::Number.with_options(decimals: 2),
    submission_type_cd: Field::String,
    withdrawn: Field::Boolean,
    withdrawn_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :competition,
    :user,
    :team,
    :submission_files,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :competition,
    :user,
    :team,
    :submission_files,
    :id,
    :evaluated,
    :score,
    :ranking,
    :submission_type_cd,
    :withdrawn,
    :withdrawn_date,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :competition,
    :user,
    :team,
    :submission_files,
    :evaluated,
    :score,
    :ranking,
    :submission_type_cd,
    :withdrawn,
    :withdrawn_date,
  ]

  # Overwrite this method to customize how submissions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(submission)
  #   "Submission ##{submission.id}"
  # end
end
