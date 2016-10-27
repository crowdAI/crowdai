class Api::DockerCallbacksController < Api::BaseController

  def create
    puts 'Docker callback'
    puts params
    render json: { message: 'API call received by server'}, status: :success
  end

end
