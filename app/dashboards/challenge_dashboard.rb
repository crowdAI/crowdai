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
    tagline: Field::String,
    status_cd: Field::String,
    description: Field::Text,
    description_markdown: Field::Text,
    evaluation: Field::Text,
    evaluation_markdown: Field::Text,
    rules: Field::Text,
    rules_markdown: Field::Text,
    prizes: Field::Text,
    prizes_markdown: Field::Text,
    resources: Field::Text,
    resources_markdown: Field::Text,
    submission_instructions: Field::Text,
    submission_instructions_markdown: Field::Text,
    dataset_description: Field::Text,
    dataset_description_markdown: Field::Text,
    primary_sort_order_cd: Field::String,
    secondary_sort_order_cd: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :challenge,
    :status_cd,
    :organizer,
    :dataset_files,
    :submissions
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :organizer,
    :dataset_files,
    :events,
    :submissions,
    :topics,
    :image,
    :challenge,
    :tagline,
    :status_cd,
    :description,
    :description_markdown,
    :evaluation,
    :evaluation_markdown,
    :rules,
    :rules_markdown,
    :prizes,
    :prizes_markdown,
    :resources,
    :resources_markdown,
    :submission_instructions,
    :submission_instructions_markdown,
    :dataset_description,
    :dataset_description_markdown,
    :primary_sort_order_cd,
    :secondary_sort_order_cd,
    :created_at,
    :updated_at
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
    :tagline,
    :status_cd,
    :description,
    :evaluation,
    :rules,
    :prizes,
    :resources,
    :submission_instructions,
    :dataset_description,
    :primary_sort_order_cd,
    :secondary_sort_order_cd
  ]

  # Overwrite this method to customize how challenges are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(challenge)
     "#{challenge.challenge}"
  end
end
