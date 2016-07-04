require "administrate/base_dashboard"

class ArticleSectionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    article: Field::BelongsTo,
    id: Field::Number,
    seq: Field::Number,
    description_markdown: Field::Text,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    icon: Field::String,
    section: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :article,
    :id,
    :seq,
    :description_markdown,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :article,
    :id,
    :seq,
    :description_markdown,
    :description,
    :created_at,
    :updated_at,
    :icon,
    :section,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :article,
    :seq,
    :description_markdown,
    :description,
    :icon,
    :section,
  ].freeze

  # Overwrite this method to customize how article sections are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article_section)
  #   "ArticleSection ##{article_section.id}"
  # end
end
