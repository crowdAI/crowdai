module Profile
  class ContactsController < ProfileController
    before_action :set_participant, :set_stats
  end
end
