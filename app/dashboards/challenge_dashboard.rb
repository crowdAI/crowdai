require "administrate/base_dashboard"

class ChallengeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    organizer: Field::BelongsTo,
    dataset_files: Field::HasMany,
    events: Field::HasMany,
    submissions: Field::HasMany,
    topics: Field::HasMany,
    image: Field::HasOne,
    challenge: Field::String,
    status_cd: Field::String,
    description: Field::Text,
    evaluation_markdown: Field::Text,
    rules: Field::Text,
    prizes: Field::Text,
    resources: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    dataset_description: Field::Text,
    submission_instructions: Field::Text,
    tagline: Field::String,
    evaluation_rendered: Field::Text,
    score_sort_cd: Field::String,
    score_secondary_sort_cd: Field::String
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :challenge,
    :organizer,
    :dataset_files,
    :submissions,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :organizer,
    :dataset_files,
    :events,
    :submissions,
    :topics,
    :image,
    :id,
    :challenge,
    :status_cd,
    :description,
    :evaluation_markdown,
    :rules,
    :prizes,
    :resources,
    :created_at,
    :updated_at,
    :dataset_description,
    :submission_instructions,
    :tagline,
    :evaluation_rendered,
    :score_sort_cd,
    :score_secondary_sort_cd,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :organizer,
    :dataset_files,
    :events,
    :submissions,
    :topics,
    :image,
    :challenge,
    :status_cd,
    :description,
    :evaluation_markdown,
    :rules,
    :prizes,
    :resources,
    :dataset_description,
    :submission_instructions,
    :tagline,
    :evaluation_rendered,
    :score_sort_cd,
    :score_secondary_sort_cd,
  ]

  # Overwrite this method to customize how challenges are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(challenge)
     "#{challenge.challenge}"
  end
end
