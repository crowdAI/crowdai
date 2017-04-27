class Discussion::Cell::List < Cell::Concept
  inherit_views Discussion::Cell

  include Kaminari::Cells
  include ActionView::Helpers::JavaScriptHelper

  def show
    render :list
  end

  def topics
    model
  end
  
end
