class RobotsTxt
  def self.call(env)
    # start building a new response
    response = Rack::Response.new

    # set content type to plain txt file
    response['Content-Type'] = 'text/plain'
    # cache the response for one year, so that further requests won't hit
    # the application
    response['Cache-Control'] = 'public, max-age=31557600' # cache for 1 year

    # if we're not in production env, set the content to disallow all robots
    unless Rails.env.production?
      # disallow access to the whole site (/) for all agents (*)
      response.write "User-agent: *\nDisallow: /"
    end

    response.finish
  end
end
