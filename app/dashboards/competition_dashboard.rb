require "administrate/base_dashboard"

class ChallengeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    organizer: Field::BelongsTo,
    dataset: Field::HasOne,
    dataset_files: Field::HasMany,
    timelines: Field::HasMany,
    submissions: Field::HasMany,
    user_challenges: Field::HasMany,
    users: Field::HasMany,
    leaderboards: Field::HasMany,
    topics: Field::HasMany,
    image: Field::HasOne,
    id: Field::Number,
    challenge: Field::String,
    status_cd: Field::String,
    description: Field::Text,
    evaluation: Field::Text,
    evaluation_criteria: Field::Text,
    rules: Field::Text,
    prizes: Field::Text,
    resources: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    dataset_description: Field::Text,
    submission_instructions: Field::Text,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :organizer,
    :dataset,
    :dataset_files,
    :timelines,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :organizer,
    :dataset,
    :dataset_files,
    :timelines,
    :submissions,
    :user_challenges,
    :users,
    :leaderboards,
    :topics,
    :image,
    :id,
    :challenge,
    :status_cd,
    :description,
    :evaluation,
    :evaluation_criteria,
    :rules,
    :prizes,
    :resources,
    :created_at,
    :updated_at,
    :dataset_description,
    :submission_instructions,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :organizer,
    :dataset,
    :dataset_files,
    :timelines,
    :submissions,
    :user_challenges,
    :users,
    :leaderboards,
    :topics,
    :image,
    :challenge,
    :status_cd,
    :description,
    :evaluation,
    :evaluation_criteria,
    :rules,
    :prizes,
    :resources,
    :dataset_description,
    :submission_instructions,
  ]

  # Overwrite this method to customize how challenges are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(challenge)
  #   "Challenge ##{challenge.id}"
  # end
end
