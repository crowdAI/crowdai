class EmailStateMachine
  include Statesman::Machine
  include Statesman::Events

  state :prepared, initial: true
  state :cancelled
  state :consolidated
  state :scheduled
  state :paused
  state :mandrill_sent
  state :mandrill_rejected
  state :mandrill_bounced
  state :mandrill_opened

  after_transition do |model, transition|
    model.state = transition.to_state
    model.save!
  end

  event :cancel do
    transition from: :prepared, to: :cancelled
    transition from: :paused, to: :cancelled
    transition from: :scheduled, to: :cancelled
  end

  event :send do
    transition from: :prepared, to: :mandrill_sent
    transition from: :scheduled, to: :mandrill_sent
  end

  event :pause do
    transition from: :prepared, to: :paused
  end

  event :schedule do
    transition from: :prepared, to: :scheduled
  end

  event :consolidate do
    transition from: :prepared, to: :consolidated
  end

  event :opened do
    transition from: :mandrill_sent, to: :mandrill_opened
  end

  event :bounced do
    transition from: :mandrill_sent, to: :mandrill_bounced
  end

  event :rejected do
    transition from: :mandrill_sent, to: :mandrill_rejected
    transition from: :prepared, to: :mandrill_rejected
    transition from: :scheduled, to: :mandrill_rejected
  end

end
