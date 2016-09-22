module Admin
  class ChallengesController < Admin::ApplicationController

    def find_resource(param)
      Challenge.find_by!(slug: param)
    end
  end
end
