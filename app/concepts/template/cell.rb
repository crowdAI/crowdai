class Template::Cell < Cell::Concept
  include Pundit
  #include Devise::Controllers::Helpers
  #Devise::Controllers::Helpers.define_helpers(Devise::Mapping.new(:participant, {}))
  include Escaped
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::RecordTagHelper
  include ActionView::Helpers::UrlHelper

  def current_participant
    options[:current_participant]
  end

  def current_participant?
    current_participant
  end

  def current_user
    current_participant
  end

end
