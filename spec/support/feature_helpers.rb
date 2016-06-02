module FeatureHelpers
  def current_path
    URI.parse(current_url).path
  end
end
