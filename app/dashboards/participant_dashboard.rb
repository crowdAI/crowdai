require "administrate/base_dashboard"

class ParticipantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    submissions: Field::HasMany,
    posts: Field::HasMany,
    organizer: Field::BelongsTo,
    image: Field::HasOne,
    challenge_downloads: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    failed_attempts: Field::Number,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
    admin: Field::Boolean,
    verified: Field::Boolean,
    verification_date: Field::DateTime,
    country: Field::String,
    city: Field::String,
    timezone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    unconfirmed_email: Field::String,
    name: Field::String,
    email_public: Field::Boolean,
    bio: Field::Text,
    website: Field::String,
    github: Field::String,
    linkedin: Field::String,
    twitter: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :submissions,
    :posts,
    :organizer,
    :image,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :submissions,
    :posts,
    :organizer,
    :image,
    :challenge_downloads,
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :failed_attempts,
    :unlock_token,
    :locked_at,
    :admin,
    :verified,
    :verification_date,
    :country,
    :city,
    :timezone,
    :created_at,
    :updated_at,
    :unconfirmed_email,
    :name,
    :email_public,
    :bio,
    :website,
    :github,
    :linkedin,
    :twitter,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :submissions,
    :posts,
    :organizer,
    :image,
    :challenge_downloads,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :failed_attempts,
    :unlock_token,
    :locked_at,
    :admin,
    :verified,
    :verification_date,
    :country,
    :city,
    :timezone,
    :unconfirmed_email,
    :name,
    :email_public,
    :bio,
    :website,
    :github,
    :linkedin,
    :twitter,
  ]

  # Overwrite this method to customize how participants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(participant)
  #   "Participant ##{participant.id}"
  # end
end
