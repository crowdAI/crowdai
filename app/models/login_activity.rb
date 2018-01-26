class LoginActivity < ApplicationRecord
  belongs_to :user, polymorphic: true, optional: true, class_name: 'Participant'
end
