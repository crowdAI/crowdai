require "administrate/base_dashboard"

class CompetitionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hosting_institution: Field::BelongsTo,
    datasets: Field::HasMany,
    timelines: Field::HasMany,
    submissions: Field::HasMany,
    user_competitions: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    competition: Field::String,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    status_cd: Field::String,
    description: Field::Text,
    evaluation: Field::Text,
    evaluation_criteria: Field::Text,
    rules: Field::Text,
    prizes: Field::Text,
    resources: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :hosting_institution,
    :datasets,
    :timelines,
    :submissions,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :hosting_institution,
    :datasets,
    :timelines,
    :submissions,
    :user_competitions,
    :users,
    :id,
    :competition,
    :start_date,
    :end_date,
    :status_cd,
    :description,
    :evaluation,
    :evaluation_criteria,
    :rules,
    :prizes,
    :resources,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :hosting_institution,
    :datasets,
    :timelines,
    :submissions,
    :user_competitions,
    :users,
    :competition,
    :start_date,
    :end_date,
    :status_cd,
    :description,
    :evaluation,
    :evaluation_criteria,
    :rules,
    :prizes,
    :resources,
  ]

  # Overwrite this method to customize how competitions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(competition)
  #   "Competition ##{competition.id}"
  # end
end
