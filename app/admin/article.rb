ActiveAdmin.register Article do

  sidebar "Sections", only: [:show, :edit] do
    ul do
      li link_to "Sections", admin_article_article_sections_path(article)
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    column :article
    column :published
    column :view_count
    column :vote_count
    actions
  end
end
