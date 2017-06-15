module SearchableArticle
  extend ActiveSupport::Concern

  included do
    searchkick callbacks: :async

    def search_data
      {
        id: self.id
      }
    end
  end
end
