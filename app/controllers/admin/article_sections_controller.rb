module Admin
  class ArticleSectionsController < Admin::ApplicationController

    def find_resource(param)
      Article.find_by!(slug: param)
    end

  end
end
