class LandingPage
  include Capybara::DSL

  def index
    visit '/'
    self
  end

end
