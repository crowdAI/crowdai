require "administrate/base_dashboard"

class HostingInstitutionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    challenges: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    institution: Field::String,
    address: Field::Text,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    approved: Field::Boolean,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :challenges,
    :users,
    :id,
    :institution,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :challenges,
    :users,
    :id,
    :institution,
    :address,
    :description,
    :created_at,
    :updated_at,
    :approved,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenges,
    :users,
    :institution,
    :address,
    :description,
    :approved,
  ]

  # Overwrite this method to customize how hosting institutions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hosting_institution)
  #   "HostingInstitution ##{hosting_institution.id}"
  # end
end
