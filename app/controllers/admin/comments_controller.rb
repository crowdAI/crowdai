module Admin
  class CommentsController < Admin::ApplicationController

    def find_resource(param)
      Comment.find_by!(slug: param)
    end

  end
end
