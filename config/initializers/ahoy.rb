
class Ahoy::Store < Ahoy::Stores::ActiveRecordTokenStore
  def user
    controller.current_participant
  end
end
