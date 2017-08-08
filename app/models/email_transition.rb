# == Schema Information
#
# Table name: email_transitions
#
#  id          :integer          not null, primary key
#  to_state    :string           not null
#  metadata    :text             default({})
#  sort_key    :integer          not null
#  email_id    :integer          not null
#  most_recent :boolean          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_email_transitions_parent_most_recent  (email_id,most_recent) UNIQUE
#  index_email_transitions_parent_sort         (email_id,sort_key) UNIQUE
#

class EmailTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  belongs_to :email, inverse_of: :email_transitions
  after_destroy :update_most_recent, if: :most_recent?

  private
  def update_most_recent
    last_transition = email.email_transitions.order(:sort_key).last
    return unless last_transition.present?
    last_transition.update_column(:most_recent, true)
  end
end
