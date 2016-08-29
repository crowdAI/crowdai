class Api::DockerCallbacksController < Api::BaseController

  def create
    puts 'Docker callback'
    puts params
    render json: { message: 'API call recieved by server'}, status: :success
  end

end
