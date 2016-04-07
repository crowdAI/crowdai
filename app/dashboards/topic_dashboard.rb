require "administrate/base_dashboard"

class TopicDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    challenge: Field::BelongsTo,
    user: Field::BelongsTo,
    posts: Field::HasMany,
    id: Field::Number,
    topic: Field::String,
    sticky: Field::Boolean,
    views: Field::Number,
    posts_count: Field::Number,
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
    :user,
    :posts,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :challenge,
    :user,
    :posts,
    :id,
    :topic,
    :sticky,
    :views,
    :posts_count,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenge,
    :user,
    :posts,
    :topic,
    :sticky,
    :views,
    :posts_count,
  ]

  # Overwrite this method to customize how topics are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(topic)
  #   "Topic ##{topic.id}"
  # end
end
