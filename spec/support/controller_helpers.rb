module ControllerHelpers
  def double_sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
    allow(user).to receive(:hosting_institution=).and_return nil
    allow(user).to receive(:save!).and_return true
  end
end
