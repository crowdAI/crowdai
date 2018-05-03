class NotebookService
  include HTTParty
  debug_output $stdout

  def initialize(notebook_url:)
    @notebook_url = notebook_url
  end

  def call
    begin
      response = HTTParty.get(@notebook_url, verify: false)
      json = response.body
    rescue
      json = nil
    ensure
      return json
    end
  end

end
