module ControllerHelpers
  def double_sign_in(participant = double('participant'))
    if participant.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :participant})
      allow(controller).to receive(:current_participant).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(participant)
      allow(controller).to receive(:current_participant).and_return(participant)
    end
    allow(participant).to receive(:organizer=).and_return nil
    allow(participant).to receive(:admin?).and_return true
    allow(participant).to receive(:save!).and_return true
  end
end
