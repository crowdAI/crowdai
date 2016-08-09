require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    participant: Field::BelongsTo,
    votes: Field::HasMany,
    comments: Field::HasMany,
    article_sections: Field::HasMany,
    image: Field::HasOne,
    id: Field::Number,
    article: Field::String,
    published: Field::Boolean,
    vote_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    category: Field::String,
    view_count: Field::Number,
    comment_count: Field::Number,
    summary: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :article,
    :published,
    :participant,
    :vote_count,
    :view_count
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :article,
    :participant,
    :votes,
    :comments,
    :article_sections,
    :image,
    :id,
    :published,
    :vote_count,
    :created_at,
    :updated_at,
    :category,
    :view_count,
    :comment_count,
    :summary,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :participant,
    :votes,
    :comments,
    :article_sections,
    :image,
    :article,
    :published,
    :vote_count,
    :category,
    :view_count,
    :comment_count,
    :summary,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article)
  #   "Article ##{article.id}"
  # end
end
