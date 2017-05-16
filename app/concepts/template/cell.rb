class Template::Cell < Cell::Concept
  include Pundit
  include Devise::Controllers::Helpers
  Devise::Controllers::Helpers.define_helpers(Devise::Mapping.new(:participant, {}))
  include Escaped
  include Kaminari::Cells
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::DateHelper

  def current_user
    current_participant
  end
end
