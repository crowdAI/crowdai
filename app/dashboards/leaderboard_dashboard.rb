require "administrate/base_dashboard"

class LeaderboardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    challenge: Field::BelongsTo,
    participant: Field::BelongsTo,
    row_num: Field::Number,
    id: Field::Number,
    name: Field::String,
    entries: Field::Number,
    score: Field::Number.with_options(decimals: 2),
    score_secondary: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :challenge,
    :participant,
    :row_num,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :challenge,
    :participant,
    :row_num,
    :id,
    :name,
    :entries,
    :score,
    :score_secondary,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenge,
    :participant,
    :row_num,
    :name,
    :entries,
    :score,
    :score_secondary,
  ]

  # Overwrite this method to customize how leaderboards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(leaderboard)
  #   "Leaderboard ##{leaderboard.id}"
  # end
end
