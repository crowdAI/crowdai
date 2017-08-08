# == Schema Information
#
# Table name: emails
#
#  id                      :integer          not null, primary key
#  model_id                :integer
#  mailer_classname        :string
#  recipients              :text
#  options                 :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  email_preferences_token :string
#  token_expiration_dttm   :datetime
#  participant_id          :integer
#  options_json            :jsonb
#  mailer_id               :integer
#  state                   :string
#
# Indexes
#
#  index_emails_on_mailer_id  (mailer_id)
#
# Foreign Keys
#
#  fk_rails_...  (mailer_id => mailers.id)
#

class Email < ApplicationRecord
  belongs_to :mailer
  belongs_to :participant, optional: true
  has_many :email_transitions, autosave: false

  validates :mailer_classname, presence: true
  validates :recipients, presence: true
  validates :state, presence: true

  delegate :in_state?, :current_state, :trigger!, :available_events, to: :state_machine
  def state_machine
    @state_machine ||= EmailStateMachine.new(self, transition_class: EmailTransition,
                                                    association_name: :email_transitions)
  end
end
