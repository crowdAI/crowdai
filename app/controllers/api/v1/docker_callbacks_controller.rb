class Api::V1::DockerCallbacksController < Api::V1::BaseController

  def callback
    puts 'Docker callback'
    puts params
    render json: { message: 'API call recieved by server'}, status: :success
  end

end
