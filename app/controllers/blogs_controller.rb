class BlogsController < InheritedResources::Base

  private

    def blog_params
      params.require(:blog).permit(:participant_id, :title, :body, :published, :vote_count, :view_count)
    end
end

