class RegistrationsController < Devise::RegistrationsController

  before_action :check_new_registration_allowed?, only: [:new, :create]

  protected

  def check_new_registration_allowed?
    redirect_to root_path, :flash => { :error => "Registrations are now closed" }
  end

end
