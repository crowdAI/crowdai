module Admin
  class ArticlesController < Admin::ApplicationController

    def find_resource(param)
      Article.friendly.find(params[:id])
    end

  end
end
